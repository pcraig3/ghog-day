var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')
const createError = require('http-errors')
const aAnAre = require('../filters/aAnAre')
const path = require('path')
const sizeOf = require('image-size')

/* Constants */
const EARLIEST_RECORDED_PREDICTION = DB()
  .prepare('SELECT MIN(year) as year FROM predictions;')
  .get().year

// TODO: This should actually be 2022 until Feb 2nd
const CURRENT_YEAR = new Date().getFullYear()

/* Utils */
function _getPercent(percent, total) {
  return Math.round((percent / total) * 100)
}

// https://bobbyhadz.com/blog/javascript-get-multiple-random-elements-from-array
const _getRandomItems = (arr, { length = 3 } = {}) => {
  const shuffled = [...arr].sort(() => 0.5 - Math.random())
  return shuffled.slice(0, length)
}

// not that good, but fast
const _getDaysToGroundhogDay = () => {
  const diffInMs = new Date('2023-02-02Z05:00:00') - new Date()
  return Math.ceil(diffInMs / (1000 * 60 * 60 * 24))
}

const _escapeHtml = (unsafe) => {
  if (typeof unsafe !== 'string') return unsafe

  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;')
}

const _getUrlFromRequest = (req, { withPath = true, trailingSlash = true } = {}) => {
  let url = 'https://' + req.get('host')
  url = withPath ? `${url}${req.path}` : url
  return trailingSlash
    ? url.endsWith('/')
      ? url
      : `${url}/`
    : url.endsWith('/')
    ? url.slice(0, -1) // eslint-disable-line indent
    : url // eslint-disable-line indent
}

const _getPageMeta = (req, description, slug) => {
  let dimensions
  if (slug) {
    dimensions = sizeOf(path.resolve(__dirname, `../../public/images/ghogs/og-image/${slug}.png`))
  }

  return {
    ...(description && { description }),
    ...(slug && { image: slug, imageWidth: dimensions.width, imageHeight: dimensions.height }),
    canonical: _getUrlFromRequest(req, { trailingSlash: false }),
    baseUrl: _getUrlFromRequest(req, { withPath: false }),
  }
}

/* Queries */
const getGroundhogSlugs = () =>
  DB()
    .prepare('SELECT slug FROM groundhogs;')
    .all()
    .map((row) => row.slug)

const getGroundhogIDs = () =>
  DB()
    .prepare('SELECT id FROM groundhogs;')
    .all()
    .map((row) => row.id)

const getPredictionsByYear = (year) => {
  let predictions = DB()
    .prepare(
      `
    SELECT json_object(
      'year', p.year,
      'shadow', p.shadow,
      'details', p.details,
      'groundhog', (SELECT json_object(
        'id', g.id,
        'slug', g.slug,
        'shortname', g.shortname,
        'name', g.name,
        'city', g.city,
        'region', g.region,
        'country', g.country,
        'source', g.source,
        'contact', g.contact,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'active', g.active,
        'description', g.description
      ) AS gh
      FROM groundhogs AS g
      WHERE g.slug = p.slug
    )) AS predictions
    FROM predictions AS p
    WHERE year = ?
    ORDER BY (SELECT Count(*) FROM predictions WHERE slug = p.slug) DESC;`,
    )
    .all(year)

  const formattedPredictions = []
  predictions.forEach((p) => formattedPredictions.push(JSON.parse(p.predictions)))

  return formattedPredictions
}

// TODO: due to the subquery, this call might be inefficient
// Could fix this with 2 calls (all predictions + all groundhogs) and then loop through in code
const _getPredictions = ({ since = 2018 } = {}) => {
  let predictions = DB()
    .prepare(
      `
    SELECT json_group_array(json_object(
      'year', p.year,
      'shadow', p.shadow,
      'details', p.details,
      'groundhog', (SELECT json_object(
        'id', g.id,
        'slug', g.slug,
        'shortname', g.shortname,
        'name', g.name,
        'city', g.city,
        'region', g.region,
        'country', g.country,
        'source', g.source,
        'contact', g.contact,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'active', g.active,
        'description', g.description
      ) AS gh
      FROM groundhogs AS g
      WHERE g.slug = p.slug
    ))) AS predictions
    FROM predictions AS p
    WHERE p.year >= ?;
  `,
    )
    .all(since)

  const formattedPredictions = {}
  let parsed = JSON.parse(predictions[0].predictions)

  parsed.forEach((p) => {
    if (!formattedPredictions[p.year]) formattedPredictions[p.year] = []
    formattedPredictions[p.year].push(p)
  })

  // return obj like {2020: [...], 2021: [...], 2022: [...]}
  return formattedPredictions
}

const _getGroundhog = (value, { identifier = 'slug', oldestFirst = false } = {}) => {
  const orderBy = oldestFirst ? 'ASC' : 'DESC'
  const by = identifier === 'slug' ? 'slug' : 'id'

  let groundhogObj = DB()
    .prepare(
      `
    SELECT json_object(
      'id', g.id,
      'slug', g.slug,
      'shortname', g.shortname,
      'name', g.name,
      'city', g.city,
      'region', g.region,
      'country', g.country,
      'source', g.source,
      'contact', g.contact,
      'currentPrediction', g.currentPrediction,
      'isGroundhog', g.isGroundhog,
      'type', g.type,
      'active', g.active,
      'description', g.description,
      'predictions', (
        SELECT json_group_array(o)
        FROM (SELECT json_object(
              'year', p.year,
              'shadow', p.shadow,
              'details', p.details
            ) AS o
            FROM predictions AS p
            WHERE p.slug = g.slug
            ORDER BY p.year ${orderBy}
        )
      )
    ) AS groundhog
    FROM groundhogs AS g
    WHERE ${by} = ?;`,
    )
    .get(value)

  if (groundhogObj) {
    groundhogObj = JSON.parse(groundhogObj.groundhog)
    // predictions come back as an array of strings, not an array of objects
    groundhogObj.predictions = groundhogObj.predictions.map((p) =>
      typeof p === 'string' ? JSON.parse(p) : p,
    )
  }

  return groundhogObj
}

const getGroundhogById = (id, { oldestFirst = false } = {}) => {
  return _getGroundhog(id, { identifier: 'id', oldestFirst })
}

const getGroundhogBySlug = (slug, { oldestFirst = true } = {}) => {
  return _getGroundhog(slug, { identifier: 'slug', oldestFirst })
}

const getGroundhogs = ({ oldestFirst = false, year = false } = {}) => {
  const orderBy = oldestFirst ? 'ASC' : 'DESC'
  const predictionKey = year ? 'latestPrediction' : 'predictions'
  const yearClause = year ? 'AND p.year = 2022' : ''

  let [{ groundhogs }] = DB()
    .prepare(
      `
      SELECT json_group_array(
        json_object(
        'id', g.id,
        'slug', g.slug,
        'shortname', g.shortname,
        'name', g.name,
        'city', g.city,
        'region', g.region,
        'country', g.country,
        'source', g.source,
        'contact', g.contact,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'active', g.active,
        'description', g.description,
        'predictionsCount', (SELECT json_array_length(json_group_array(id)) FROM predictions WHERE slug=g.slug AND shadow IS NOT NULL),
        '${predictionKey}', (
          ${year ? '' : 'SELECT json_group_array(o) FROM ('}
          SELECT json_object(
                'year', p.year,
                'shadow', p.shadow,
                'details', p.details
              ) AS o
              FROM predictions AS p
              WHERE p.slug = g.slug ${yearClause}
              ORDER BY p.year ${orderBy}
          )
        )
        ${year ? '' : ')'}
      ) as groundhogs
      FROM groundhogs AS g;`,
    )
    .all()

  return JSON.parse(groundhogs)
}

/* Middleware */
const validYear = (req, res, next) => {
  let year = req.params.year || req.query.year
  year = parseInt(year)

  if (isNaN(year) || year < EARLIEST_RECORDED_PREDICTION || year > CURRENT_YEAR) {
    throw new createError(
      400,
      `The <code>year</code> must be between ${_escapeHtml(
        EARLIEST_RECORDED_PREDICTION,
      )} and ${_escapeHtml(CURRENT_YEAR)} (inclusive).`,
    )
  }

  next()
}

const validId = (req, res, next) => {
  const id = parseInt(req.params.gId)
  const ids = getGroundhogIDs()

  if (isNaN(id) || !ids.includes(id)) {
    throw new createError(
      400,
      `Bad groundhog identifier (<code>${_escapeHtml(id)}</code>), pick a real one.`,
    )
  }

  next()
}

const validSlug = (req, res, next) => {
  const slug = req.params.slug
  const slugs = getGroundhogSlugs()

  if (!slug) {
    var randomSlug = slugs[Math.floor(Math.random() * slugs.length)]
    throw new createError(
      400,
      `You didn’t pick a groundhog. Here’s a random one: <code><a href="/groundhogs/${_escapeHtml(
        randomSlug,
      )}">${_escapeHtml(randomSlug)}</a></code>`,
    )
  }

  if (!slugs.includes(slug)) {
    throw new createError(
      400,
      `Bad groundhog identifier (<code>${_escapeHtml(slug)}</code>), maybe you spelled it wrong?`,
    )
  }

  next()
}

const redirectYear = (req, res, next) => {
  if (!req.query.year) {
    const currentYear = new Date().getFullYear()
    return res.redirect(`/api/v1/predictions?year=${currentYear}`)
  }

  next()
}

/* GET home page. */
router.get('/', function (req, res) {
  const _predictions = _getPredictions({ since: 2020 })
  const _years = Object.keys(_predictions).reverse() // otherwise earlier years come first
  const predictionResults = []

  _years.forEach((year) => {
    const yearPredictions = { year, prediction: '', groundhogs: { winter: 0, spring: 0 } }

    _predictions[year].forEach((prediction) => {
      const season = prediction.shadow ? 'winter' : 'spring'
      yearPredictions['groundhogs'][season]++
    })

    // TODO: if they are equal, this breaks
    yearPredictions.prediction =
      yearPredictions.groundhogs.winter >= yearPredictions.groundhogs.spring ? 'winter' : 'spring'

    predictionResults.push(yearPredictions)
  })

  // get groundhogs data
  const totalGroundhogs = _predictions[CURRENT_YEAR].length
  let _currentYearPredictions = _getRandomItems(_predictions[CURRENT_YEAR])
  const randomGroundhogs = _currentYearPredictions.map((p) => {
    const { shadow, groundhog: { slug, name, region, country } = {} } = p
    return {
      name,
      slug,
      shadow,
      location: `${region}, ${country}`,
    }
  })

  res.render('pages/index', {
    title: 'GROUNDHOG-DAY.com',
    daysLeft: _getDaysToGroundhogDay(),
    predictionResults,
    randomGroundhogs,
    totalGroundhogs,
    pageMeta: _getPageMeta(req),
  })
})

/* GET about page. */
router.get('/about', function (req, res) {
  res.render('pages/about', {
    title: 'About',
    pageMeta: _getPageMeta(
      req,
      'The history of our modern Groundhog Day. It’s exactly as weird as you think.',
    ),
  })
})

/* GET "add groundhog" page. */
router.get('/add-groundhog', function (req, res) {
  res.render('pages/add-groundhog', {
    title: 'Add a groundhog',
    pageMeta: _getPageMeta(
      req,
      'Add new groundhogs to GROUNDHOG-DAY.com: the more we have, the more accurate we are. It’s science.',
    ),
  })
})

/* GET api page. */
router.get('/api', function (req, res) {
  res.render('pages/api', {
    title: 'API',
    pageMeta: _getPageMeta(
      req,
      'A free JSON API for prognosticating groundhogs and their annual predictions. Get all predictions for single groundhogs or all predictions for a given year.',
    ),
  })
})

/* GET api page. */
router.get('/contact', function (req, res) {
  res.render('pages/contact', {
    title: 'Contact',
    pageMeta: _getPageMeta(
      req,
      'Please reach out with any questions, concerns, or general feedback. Unlike Jimmy the Groundhog, I don’t bite.',
    ),
  })
})

router.get('/predictions', function (req, res) {
  const _predictions = _getPredictions({ since: 1886 })
  const _years = Object.keys(_predictions).reverse() // otherwise earlier years come first
  const predictionResults = []

  _years.forEach((year) => {
    const yearPredictions = { year, prediction: '', groundhogs: { winter: 0, spring: 0, null: 0 } }

    _predictions[year].forEach((prediction) => {
      const season =
        prediction.shadow === 1 ? 'winter' : prediction.shadow === 0 ? 'spring' : 'null'
      yearPredictions['groundhogs'][season]++
    })

    yearPredictions.prediction =
      yearPredictions.groundhogs.winter === yearPredictions.groundhogs.spring
        ? 'tied'
        : yearPredictions.groundhogs.winter >= yearPredictions.groundhogs.spring
        ? 'winter' // eslint-disable-line indent
        : 'spring' // eslint-disable-line indent

    predictionResults.push(yearPredictions)
  })

  res.render('pages/years', {
    title: 'Predictions by year',
    predictions: predictionResults,
    oldestPrediction: predictionResults[predictionResults.length - 1].year,
    pageMeta: _getPageMeta(
      req,
      `See aggregate groundhog predictions by year, from ${CURRENT_YEAR} back to ${EARLIEST_RECORDED_PREDICTION} (which was before TikTok).`,
    ),
  })
})

/* GET predictions page for a year. */
router.get('/predictions/:year', validYear, function (req, res) {
  /* ~TODO: Handle no prediction */
  const year = parseInt(req.params.year)
  const predictionTotals = { years: 0, total: 0, winter: 0, spring: 0, null: 0 }
  const nameFirst = req.query.nameFirst === 'true'

  const years = {
    year,
    next: year === CURRENT_YEAR ? undefined : year + 1,
    prev: year === EARLIEST_RECORDED_PREDICTION ? undefined : year - 1,
  }

  let predictions = getPredictionsByYear(year)

  predictions.forEach((prediction) => {
    ++predictionTotals['years']

    prediction['shadow'] === 1
      ? ++predictionTotals['winter'] && ++predictionTotals['total']
      : prediction['shadow'] === 0
      ? ++predictionTotals['spring'] && ++predictionTotals['total'] // eslint-disable-line indent
      : ++predictionTotals['null'] // eslint-disable-line indent
  })

  if (nameFirst) {
    // sort by name
    predictions.sort((a, b) => (a.groundhog.name > b.groundhog.name ? 1 : -1))
  } else {
    // sort by most predictions to least predictions
    predictions.sort((a, b) => {
      return a.shadow === null ? 1 : b.shadow === null ? -1 : a.shadow - b.shadow
    })
  }

  res.render('pages/year', {
    title: `${year} predictions`,
    years,
    predictions,
    predictionTotals,
    nameFirst,
    pageMeta: _getPageMeta(
      req,
      `Groundhog predictions for ${year}. See which groundhogs are well-informed vs those that are blowing smoke.`,
    ),
  })
})

/* GET all groundhogs */
router.get('/groundhogs', function (req, res) {
  let groundhogs = getGroundhogs({ year: CURRENT_YEAR })
  const nameFirst = req.query.nameFirst === 'true'

  if (nameFirst) {
    // sort by name
    groundhogs.sort((a, b) => (a.name > b.name ? 1 : -1))
  } else {
    // sort by most predictions to least predictions
    groundhogs.sort((a, b) => b.predictionsCount - a.predictionsCount)
  }

  const recentPredictions = { total: 0, winter: 0, spring: 0 }
  groundhogs.forEach((g) => {
    ++recentPredictions['total']
    g['latestPrediction']['shadow'] ? ++recentPredictions['winter'] : ++recentPredictions['spring']
  })

  res.render('pages/groundhogs', {
    title: 'Groundhogs',
    groundhogs,
    recentPredictions: recentPredictions,
    nameFirst,
    pageMeta: _getPageMeta(
      req,
      `See all ${groundhogs.length} prognosticators, whether genuine groundhogs or otherwise. Despite the name, GROUNDHOG-DAY.com is all-welcoming.`,
    ),
  })
})

const getGroundhogMetaDescription = (groundhog, { allPredictionsCount, firstYear } = {}) => {
  const modifier = aAnAre(groundhog.type) === 'is an' ? 'oracle' : 'prognosticating'
  let secondPhrase

  if (allPredictionsCount && firstYear) {
    const verb = groundhog.type.endsWith('hogs') ? 'have' : 'has'
    secondPhrase = ` ${groundhog.name} ${verb} made ${allPredictionsCount} predictions since ${firstYear}.`
  } else {
    const prediction =
      groundhog.predictions[0].shadow === 0
        ? 'predicted an early spring'
        : groundhog.predictions[0].shadow === 1
        ? 'predicted a longer winter' // eslint-disable-line indent
        : 'did not make a prediction' // eslint-disable-line indent

    secondPhrase = ` In ${CURRENT_YEAR}, ${groundhog.shortname} ${prediction}.`
  }

  return `${groundhog.name} ${aAnAre(groundhog.type)} ${modifier} ${groundhog.type} from ${
    groundhog.city
  } in ${groundhog.region}, ${groundhog.country}.${secondPhrase}`
}

/* GET single groundhog */
router.get('/groundhogs/:slug', validSlug, (req, res) => {
  const groundhog = getGroundhogBySlug(req.params.slug, { oldestFirst: false })
  let nullPredictions = 0
  groundhog.predictions.forEach((p) => p.shadow === null && ++nullPredictions)

  res.render('pages/groundhog', {
    title: groundhog.name,
    groundhog,
    allPredictions: groundhog.predictions.length - nullPredictions,
    pageMeta: _getPageMeta(req, getGroundhogMetaDescription(groundhog), groundhog.slug),
  })
})

/* GET single groundhog */
router.get('/groundhogs/:slug/predictions', validSlug, (req, res) => {
  // years == all years (including nulls), total == all predictions (nulls are not included)
  let allPredictions = { years: 0, total: 0, shadow: 0, noShadow: 0, null: 0 }
  const oldestFirst = req.query.oldestFirst === 'true'

  let groundhog = getGroundhogBySlug(req.params.slug, { oldestFirst })
  groundhog['predictions'].forEach((p) => {
    ++allPredictions['years']

    p.shadow === 1
      ? ++allPredictions['shadow'] && ++allPredictions['total']
      : p.shadow === 0
      ? ++allPredictions['noShadow'] && ++allPredictions['total'] // eslint-disable-line indent
      : ++allPredictions['null'] // eslint-disable-line indent
  })

  const firstYear = oldestFirst
    ? groundhog.predictions[0].year
    : groundhog.predictions[groundhog.predictions.length - 1].year

  allPredictions = {
    ...allPredictions,
    percent: {
      shadow: _getPercent(allPredictions.shadow, allPredictions.total),
      noShadow: _getPercent(allPredictions.noShadow, allPredictions.total),
    },
  }

  res.render('pages/groundhog_predictions', {
    title: `${groundhog.shortname}’s Predictions`,
    groundhog,
    allPredictions,
    firstYear,
    oldestFirst,
    pageMeta: _getPageMeta(
      req,
      getGroundhogMetaDescription(groundhog, {
        allPredictionsCount: allPredictions.total,
        firstYear,
      }),
      groundhog.slug,
    ),
  })
})

/* get groundhogs as JSON */
router.get('/api/v1/groundhogs', function (req, res) {
  const groundhogs = getGroundhogs({ oldestFirst: true })
  res.send(groundhogs)
})

/* get a single groundhog as JSON by id */
router.get('/api/v1/groundhogs/:gId([0-9]{0,3})', validId, function (req, res) {
  const groundhog = getGroundhogById(req.params.gId, { oldestFirst: true })
  res.send(groundhog)
})

/* get a single groundhog as JSON by slug */
router.get('/api/v1/groundhogs/:slug', validSlug, function (req, res) {
  const groundhog = getGroundhogBySlug(req.params.slug, { oldestFirst: true })
  res.send(groundhog)
})

/* get predictions for a single year as JSON */
router.get('/api/v1/predictions', redirectYear, validYear, function (req, res) {
  let predictions = getPredictionsByYear(req.query.year)

  res.send(predictions)
})

module.exports = router
