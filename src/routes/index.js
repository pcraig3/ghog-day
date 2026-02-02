const express = require('express')
const DB = require('@beenotung/better-sqlite3-helper')
const { format } = require('date-fns/format')
const createError = require('http-errors')
const aAnAre = require('../filters/aAnAre')
const path = require('path')

const router = express.Router()
const APIRouter = express.Router()

const {
  getAbsoluteYear,
  getGroundhogDayYear,
  getDaysToGroundhogDay,
  escapeHtml,
  getImageSize,
  getPercent,
  getRandomItems,
  getRandomPositiveAdjective,
  parseBoolean,
  removeTrailingSlashes,
} = require('./utils')

/* Constants */
const EARLIEST_RECORDED_PREDICTION = DB()
  .prepare('SELECT MIN(year) as year FROM predictions;')
  .get().year

const BEFORE_GROUNDHOG_DAY = getAbsoluteYear() !== getGroundhogDayYear()
const IS_GROUNDHOG_DAY = getDaysToGroundhogDay() === 365

/* Request functions */
const _getUrlFromRequest = (req, { withPath = true, trailingSlash = true } = {}) => {
  let url = 'https://' + req.get('host')
  url = withPath ? `${url}${req.path}` : url
  return trailingSlash
    ? url.endsWith('/')
      ? url
      : `${url}/`
    : url.endsWith('/')
      ? url.slice(0, -1)
      : url
}

const _getPageMeta = (req, { description, slug, speakable } = {}) => {
  let dimensions
  if (slug) {
    dimensions = getImageSize(slug)
  }

  return {
    ...(description && { description }),
    ...(slug &&
      dimensions && { image: slug, imageWidth: dimensions.width, imageHeight: dimensions.height }),
    canonical: _getUrlFromRequest(req, { trailingSlash: false }),
    baseUrl: _getUrlFromRequest(req, { withPath: false }),
    speakable,
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
        'coordinates', g.coordinates,
        'source', g.source,
        'contact', g.contact,
        'currentPrediction', g.currentPrediction,
        'predictionsCount', (SELECT json_array_length(json_group_array(id)) FROM predictions WHERE slug=g.slug AND shadow IS NOT NULL),
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'active', g.active,
        'successor', g.successor,
        'description', g.description,
        'image', g.image
      ) AS gh
      FROM groundhogs AS g
      WHERE g.slug = p.slug
    )) AS predictions
    FROM predictions AS p
    WHERE year = ?
    ORDER BY (SELECT Count(*) FROM predictions WHERE slug = p.slug) DESC;`,
    )
    .all(year)

  return predictions.map((p) => JSON.parse(p.predictions))
}

// TODO: due to the subquery, this call might be inefficient
// Could fix this with 2 calls (all predictions + all groundhogs) and then loop through in code
const _getPredictions = ({ since = 2022, until = getGroundhogDayYear() } = {}) => {
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
        'coordinates', g.coordinates,
        'source', g.source,
        'contact', g.contact,
        'currentPrediction', g.currentPrediction,
        'predictionsCount', (SELECT json_array_length(json_group_array(id)) FROM predictions WHERE slug=g.slug AND shadow IS NOT NULL),
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'active', g.active,
        'successor', g.successor,
        'description', g.description,
        'image', g.image
      )
      FROM groundhogs AS g
      WHERE g.slug = p.slug
    ))) AS predictions
    FROM predictions AS p
    WHERE p.year >= ? AND p.year <= ?;
  `,
    )
    .all(since, until)

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

  let { groundhog } = DB()
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
      'coordinates', g.coordinates,
      'source', g.source,
      'contact', g.contact,
      'currentPrediction', g.currentPrediction,
      'isGroundhog', g.isGroundhog,
      'type', g.type,
      'active', g.active,
      'successor', g.successor,
      'description', g.description,
      'image', g.image,
      'predictionsCount', (SELECT json_array_length(json_group_array(id)) FROM predictions WHERE slug=g.slug AND shadow IS NOT NULL),
      'predictions', (
        SELECT json_group_array(json(o))
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

  return JSON.parse(groundhog)
}

const getGroundhogById = (id, { oldestFirst = false } = {}) => {
  return _getGroundhog(id, { identifier: 'id', oldestFirst })
}

const getGroundhogBySlug = (slug, { oldestFirst = true } = {}) => {
  return _getGroundhog(slug, { identifier: 'slug', oldestFirst })
}

const getGroundhogs = ({
  oldestFirst = false,
  year = false,
  country = undefined,
  isActive = undefined,
  isGroundhog = undefined,
} = {}) => {
  const orderBy = oldestFirst ? 'ASC' : 'DESC'
  const predictionKey = year ? 'latestPrediction' : 'predictions'
  const yearClause = year ? `AND p.year = ${getGroundhogDayYear()}` : ''
  let whereClause = ['USA', 'Canada'].includes(country) ? `g.country = '${country}'` : '1 = 1'
  if (isGroundhog !== undefined) {
    whereClause = `${whereClause} AND isGroundhog='${isGroundhog ? 1 : 0}'`
  }
  if (isActive !== undefined) {
    whereClause = `${whereClause} AND active='${isActive ? 1 : 0}'`
  }

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
        'coordinates', g.coordinates,
        'source', g.source,
        'contact', g.contact,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'active', g.active,
        'successor', g.successor,
        'description', g.description,
        'image', g.image,
        'predictionsCount', (SELECT json_array_length(json_group_array(id)) FROM predictions WHERE slug=g.slug AND shadow IS NOT NULL),
        '${predictionKey}', (
          ${year ? '' : 'SELECT json_group_array(json(o)) FROM ('}
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
      FROM groundhogs AS g
      WHERE ${whereClause};`,
    )
    .all()

  return JSON.parse(groundhogs)
}

/* Middleware */
const validYear = (req, res, next) => {
  const currentYear = getGroundhogDayYear()
  let year = req.params.year || req.query.year
  year = parseInt(year)

  if (isNaN(year) || year < EARLIEST_RECORDED_PREDICTION || year > currentYear) {
    throw new createError(
      400,
      `The 'year' must be between ${escapeHtml(EARLIEST_RECORDED_PREDICTION)} and ${escapeHtml(
        currentYear,
      )} (inclusive).`,
    )
  }

  next()
}

const validId = (req, res, next) => {
  const rawId = req.params.gId

  if (!/^\d{1,3}$/.test(rawId)) {
    throw new createError(
      400,
      `Bad groundhog identifier ('${escapeHtml(rawId)}'), must be 1–3 digits.`,
    )
  }

  const id = Number(rawId)
  const ids = getGroundhogIDs()

  if (!ids.includes(id)) {
    throw new createError(
      400,
      `Bad groundhog identifier ('${escapeHtml(rawId)}'), pick a real one.`,
    )
  }

  next()
}

const validSlug = (req, res, next) => {
  const slug = req.params.slug
  const slugs = getGroundhogSlugs()

  if (!slug) {
    const randomSlug = slugs[Math.floor(Math.random() * slugs.length)]
    throw new createError(
      400,
      `You didn’t pick a groundhog. Here’s a random one: <a href="/groundhogs/${escapeHtml(
        randomSlug,
      )}">${escapeHtml(randomSlug)}</a>`,
    )
  }

  if (!slugs.includes(slug)) {
    throw new createError(
      400,
      `No groundhog for ‘${escapeHtml(
        slug,
      )}’. Maybe you want to <a class="underline" href="/add-groundhog">add a groundhog?</a>`,
    )
  }

  next()
}

const validBackUrl = (req, res, next) => {
  const _getValidGroundhogSlugFromUrl = (url) => {
    if (!url.startsWith('/groundhogs/')) return ''

    const _slug = removeTrailingSlashes(url).split('/').pop()
    return getGroundhogSlugs().find((s) => s === _slug) || ''
  }

  const url =
    req.session && req.session.prevPath && req.session.prevPath !== req.session.path
      ? req.session.prevPath
      : undefined
  if (!url) return next()

  let back
  if (url === '/') back = { url: '/', text: 'Home' }
  else if (url === '/groundhogs') back = { url, text: 'All groundhogs' }
  else if (url === '/groundhogs-in-canada') back = { url, text: 'Groundhogs in Canada' }
  else if (url === '/groundhogs-in-usa') back = { url, text: 'Groundhogs in the USA' }
  else if (url === '/alternative-groundhogs') back = { url, text: 'Alternative groundhogs' }
  else if (url === '/active-groundhogs') back = { url, text: 'Active groundhogs' }
  else if (url === '/map') {
    const _slug = _getValidGroundhogSlugFromUrl(req.session.path)
    const backTo = _slug ? `${url}?groundhog=${_slug}` : url
    back = { url: backTo, text: 'Groundhog Map' }
  } else if (url === '/predictions') back = { url, text: 'Predictions' }
  else if (url.startsWith('/predictions/')) {
    const year = parseInt(removeTrailingSlashes(url).split('/').pop())
    if (year && year >= EARLIEST_RECORDED_PREDICTION && year <= getGroundhogDayYear()) {
      back = { url, text: `Groundhog Day ${year}` }
    }
  } else if (url.startsWith('/groundhogs/')) {
    const _slug = _getValidGroundhogSlugFromUrl(url)
    const groundhog = _slug && getGroundhogBySlug(_slug)
    if (groundhog) {
      back = { url, text: groundhog.name }
    }
  }

  req.locals = { back }
  next()
}

const redirectAPIYear = (req, res, next) => {
  if (!req.query.year) {
    return res.redirect(`/api/v1/predictions?year=${getGroundhogDayYear()}`)
  }

  next()
}

/* keep previous path in session */
router.use((req, res, next) => {
  if (!req.session) req.session = {}
  if (req.session.path) req.session.prevPath = req.session.path
  req.session.path = req.path
  next()
})

/* GET home page. */
router.get('/', function (req, res) {
  const currentYear = getGroundhogDayYear()
  const _predictions = _getPredictions({
    since: getGroundhogDayYear() - 2,
    until: getGroundhogDayYear(),
  })

  const _years = Object.keys(_predictions).reverse() // otherwise earlier years come first
  const predictionResults = []

  _years.forEach((year) => {
    const yearPredictions = {
      year,
      agree: '',
      disagree: '',
      total: '',
      groundhogs: { winter: 0, spring: 0, null: 0 },
    }

    _predictions[year].forEach((prediction) => {
      const season = prediction.shadow === null ? 'null' : prediction.shadow ? 'winter' : 'spring'
      yearPredictions['groundhogs'][season]++
    })

    yearPredictions.agree =
      yearPredictions.groundhogs.winter >= yearPredictions.groundhogs.spring ? 'winter' : 'spring'

    yearPredictions.disagree =
      yearPredictions.groundhogs.winter <= yearPredictions.groundhogs.spring ? 'winter' : 'spring'

    yearPredictions.total = yearPredictions.groundhogs.winter + yearPredictions.groundhogs.spring

    predictionResults.push(yearPredictions)
  })

  // seed with empty object
  let _currentYearPredictions = [{ groundhog: { country: '' } }]

  // keep looping until at least one groundhog is from Canada
  while (!_currentYearPredictions.find((p) => p.groundhog.country === 'Canada')) {
    _currentYearPredictions = getRandomItems(_predictions[currentYear])
  }

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
    daysLeft: getDaysToGroundhogDay(),
    currentYear,
    nextYear: currentYear + 1,
    predictionResults,
    randomGroundhogs,
    totalGroundhogs: getGroundhogSlugs().length,
    isBeforeGroundhogDay: IS_GROUNDHOG_DAY || BEFORE_GROUNDHOG_DAY,
    pageMeta: _getPageMeta(req, {
      description:
        'GROUNDHOG-DAY.com is the leading Groundhog Day data source: cataloging North America’s prognosticating animals and their yearly weather predictions.',
    }),
  })
})

/* GET about page. */
router.get('/about', function (req, res) {
  res.render('pages/about', {
    title: 'About',
    pageMeta: _getPageMeta(req, {
      description:
        'Groundhog Day is a lighthearted holiday celebrated annually across North America in which ‘prognosticating’ animals predict the onset of spring.',
      speakable: true,
    }),
  })
})

/* GET history page. */
router.get('/history-of-groundhog-day', function (req, res) {
  res.render('pages/history', {
    title: 'History of Groundhog Day',
    pageMeta: _getPageMeta(req, {
      description: 'The history of our modern Groundhog Day. It’s exactly as weird as you think.',
      speakable: true,
    }),
  })
})

/* GET "add groundhog" page. */
router.get('/add-groundhog', function (req, res) {
  res.render('pages/add-groundhog', {
    title: 'Add a groundhog',
    pageMeta: _getPageMeta(req, {
      description:
        'Add new groundhogs to GROUNDHOG-DAY.com: the more we have, the more accurate we are. It’s science.',
    }),
  })
})

/* GET api page. */
router.get('/api', function (req, res) {
  res.render('pages/api', {
    title: 'Groundhog Day API',
    pageMeta: _getPageMeta(req, {
      description:
        'A free JSON API for North America’s prognosticating animals and their yearly weather predictions.',
    }),
  })
})

/* GET contact page. */
router.get('/contact', function (req, res) {
  res.render('pages/contact', {
    title: 'Contact',
    pageMeta: _getPageMeta(req, {
      description:
        'Please reach out with any questions, concerns, or general feedback. Unlike Jimmy the Groundhog, I don’t bite.',
    }),
  })
})

router.get('/predictions', function (req, res) {
  const _predictions = _getPredictions({ since: 1886, until: getGroundhogDayYear() })
  const _years = Object.keys(_predictions).reverse() // otherwise earlier years come first
  const predictionResults = []

  _years.forEach((year) => {
    const yearPredictions = {
      year,
      prediction: '',
      groundhogs: { winter: 0, spring: 0, null: 0 },
      percentConsensus: 0,
    }

    _predictions[year].forEach((prediction) => {
      const season =
        prediction.shadow === 1 ? 'winter' : prediction.shadow === 0 ? 'spring' : 'null'
      yearPredictions['groundhogs'][season]++
    })

    yearPredictions.prediction =
      yearPredictions.groundhogs.winter === yearPredictions.groundhogs.spring
        ? 'tied'
        : yearPredictions.groundhogs.winter >= yearPredictions.groundhogs.spring
          ? 'winter'
          : 'spring'

    // Get agreement percentage — if tied, there is no consensus
    if (yearPredictions.prediction !== 'tied') {
      // numerator: winning prediction, denominator: winter + spring (no nulls)
      yearPredictions['percentConsensus'] = getPercent(
        yearPredictions.groundhogs[yearPredictions.prediction],
        yearPredictions.groundhogs['winter'] + yearPredictions.groundhogs['spring'],
      )
    }

    predictionResults.push(yearPredictions)
  })

  res.render('pages/years', {
    title: 'All predictions by year',
    predictions: predictionResults,
    oldestPrediction: predictionResults[predictionResults.length - 1].year,
    pageMeta: _getPageMeta(req, {
      description: `See and compare Groundhog Day predictions by year, from ${getGroundhogDayYear()} back to ${EARLIEST_RECORDED_PREDICTION} (which was before TikTok).`,
    }),
  })
})

router.get('/predictions/2027', function (req, res) {
  return res.redirect('/groundhog-day-2027')
})

/* GET predictions page for a year. */
router.get('/predictions/:year', validYear, validBackUrl, function (req, res) {
  const back =
    req.locals && req.locals.back
      ? req.locals.back
      : { url: '/predictions', text: 'All predictions' }

  const year = parseInt(req.params.year)
  const predictionTotals = {
    years: 0,
    total: 0,
    winter: 0,
    spring: 0,
    null: 0,
    prediction: '',
  }

  const years = {
    year,
    next: year + 1,
    prev: year === EARLIEST_RECORDED_PREDICTION ? undefined : year - 1,
  }

  const dateString = format(new Date(`${year}-02-02T00:00:00`), 'iiii, MMMM do')

  let predictions = getPredictionsByYear(year)

  predictions.forEach((prediction) => {
    ++predictionTotals['years']

    prediction['shadow'] === 1
      ? ++predictionTotals['winter'] && ++predictionTotals['total']
      : prediction['shadow'] === 0
        ? ++predictionTotals['spring'] && ++predictionTotals['total']
        : ++predictionTotals['null']

    predictionTotals.prediction =
      predictionTotals.winter === predictionTotals.spring
        ? 'tied'
        : predictionTotals.winter >= predictionTotals.spring
          ? 'winter'
          : 'spring'
  })

  // sort by most predictions to least predictions
  predictions.sort((a, b) => {
    return a.shadow === null ? 1 : b.shadow === null ? -1 : a.shadow - b.shadow
  })

  const predictionTied = predictionTotals['prediction'] === 'tied'
  const predictionPercent = predictionTied
    ? 0
    : getPercent(predictionTotals[predictionTotals['prediction']], predictionTotals['total'])
  const intro = {
    lead: `In ${year}, Groundhog Day was on ${dateString}`,
    predictionTied,
    predictionPercent,
    predictionIntro: `Most groundhogs (${predictionPercent}%) predicted`,
    predictionConclusion:
      predictionTotals['total'] === 0
        ? 'No predictions were reported for this year'
        : predictionTotals['prediction'] === 'tied'
          ? 'Half of groundhogs predicted an early spring, and half predicted a longer winter'
          : predictionTotals['prediction'] === 'winter'
            ? 'a longer winter'
            : 'an early spring',
  }

  const predictionTitle =
    predictionTotals['total'] === 0
      ? 'No data'
      : predictionTotals.prediction === 'tied'
        ? 'Tied'
        : predictionTotals.prediction === 'winter'
          ? 'Longer winter'
          : 'Early spring'

  res.render('pages/year', {
    title: `Groundhog Day ${year} results: ${predictionTitle}`,
    years,
    intro,
    nextYear: getGroundhogDayYear() + 1,
    isBeforeGroundhogDay:
      year == getGroundhogDayYear() && (BEFORE_GROUNDHOG_DAY || IS_GROUNDHOG_DAY),
    predictions,
    predictionTotals,
    pageMeta: _getPageMeta(req, {
      description: `${intro.lead}. ${intro.predictionIntro} ${intro.predictionConclusion}.`,
      speakable: true,
    }),
    back,
  })
})

router.get('/groundhog-day-2025', function (req, res) {
  return res.redirect(301, '/predictions/2025')
})

router.get('/groundhog-day-2024', function (req, res) {
  return res.redirect(301, '/predictions/2024')
})

router.get('/groundhog-day-2023', function (req, res) {
  return res.redirect(301, '/predictions/2023')
})

/* GET 2026 (upcoming) page */
router.get('/groundhog-day-2027', validBackUrl, function (req, res) {
  const currentYear = getGroundhogDayYear()
  const nextYear = currentYear + 1
  const back = req.locals && req.locals.back ? req.locals.back : { url: '/', text: 'Home' }

  const predictionTotals = { years: 0, total: 0, winter: 0, spring: 0, null: 0 }
  let predictions = getPredictionsByYear(currentYear)
  predictions.forEach((prediction) => {
    ++predictionTotals['years']

    prediction['shadow'] === 1
      ? ++predictionTotals['winter'] && ++predictionTotals['total']
      : prediction['shadow'] === 0
        ? ++predictionTotals['spring'] && ++predictionTotals['total']
        : ++predictionTotals['null']
  })

  const predictionString =
    predictionTotals['winter'] > predictionTotals['spring'] ? 'a longer winter' : 'an early spring'

  const dateString = format(new Date(`${nextYear}-02-02T00:00:00`), 'iiii, MMMM do')

  res.render('pages/upcoming/groundhog-day-next', {
    title: `Groundhog Day ${nextYear}`,
    currentYear,
    nextYear,
    dateString,
    daysLeft: getDaysToGroundhogDay(),
    predictionString,
    isBeforeGroundhogDay: BEFORE_GROUNDHOG_DAY,
    pageMeta: _getPageMeta(req, {
      description: `In ${nextYear}, Groundhog Day will be on ${dateString}. Groundhog Day is not a statutory holiday in Canada or the USA.`,
      speakable: true,
    }),
    back,
  })
})

/* GET all groundhogs */
router.get(
  [
    '/groundhogs',
    '/groundhogs-in-canada',
    '/groundhogs-in-usa',
    '/alternative-groundhogs',
    '/active-groundhogs',
  ],
  function (req, res) {
    const path = req.path.replace(/\/$/, '')

    const country =
      path === '/groundhogs-in-canada'
        ? 'Canada'
        : path === '/groundhogs-in-usa'
          ? 'USA'
          : undefined

    const isGroundhog = path === '/alternative-groundhogs' ? false : undefined
    const isActive = path === '/active-groundhogs' ? true : undefined

    let groundhogs = getGroundhogs({ year: getGroundhogDayYear(), country, isGroundhog, isActive })

    // sort by most predictions to least predictions
    groundhogs.sort((a, b) => b.predictionsCount - a.predictionsCount)

    const groundhogCounts = { groundhog: 0, other: 0, canada: 0, usa: 0, active: 0, retired: 0 }

    groundhogs.forEach((g) => {
      // set groundhogCounts.groundhog|groundhogCounts.other
      g.type === 'Groundhog' ? ++groundhogCounts.groundhog : ++groundhogCounts.other
      // set groundhogCounts.canada|groundhogCounts.usa
      g.country === 'Canada' ? ++groundhogCounts.canada : ++groundhogCounts.usa
      // set groundhogCounts.active|groundhogCounts.retired
      g.active ? ++groundhogCounts.active : ++groundhogCounts.retired
    })

    const pageTitle = path.includes('canada')
      ? 'Groundhogs in Canada'
      : path.includes('usa')
        ? 'Groundhogs in the USA'
        : path.includes('alternative')
          ? 'Alternative groundhogs'
          : path.includes('active')
            ? 'Active groundhogs'
            : 'All groundhogs'
    const adjective = path.includes('canada')
      ? 'Canadian '
      : path.includes('usa')
        ? 'American '
        : path.includes('alternative')
          ? 'non-traditional '
          : path.includes('alternative')
            ? 'active '
            : ''

    const pageTemplate = path.includes('alternative')
      ? '/groundhogs-alternative'
      : path.includes('active')
        ? '/groundhogs-active'
        : path

    res.render(`pages/${pageTemplate}`, {
      title: pageTitle,
      groundhogs,
      groundhogCounts,
      pageMeta: _getPageMeta(req, {
        description: `See a list of all ${groundhogs.length} ${adjective}prognosticators${
          path.includes('alternative')
            ? ' across Canada and the USA'
            : ', whether genuine groundhogs or otherwise'
        }. Despite the name, GROUNDHOG-DAY.com is all-welcoming.`,
      }),
    })
  },
)

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
          ? 'predicted a longer winter'
          : 'did not make a prediction'

    secondPhrase = ` In ${groundhog.predictions[0].year}, ${groundhog.shortname} ${prediction}.`
  }

  return `${groundhog.name} ${aAnAre(groundhog.type)} ${modifier} ${groundhog.type} from ${
    groundhog.city
  } in ${groundhog.region}, ${groundhog.country}.${secondPhrase}`
}

/* redirect sylvia since we changed the ID */
router.get('/groundhogs/sylvia-the-armadillo', function (req, res) {
  return res.redirect(301, '/groundhogs/sylvia-the-apex-armadillo')
})

/* GET single groundhog */
router.get('/groundhogs/:slug', validSlug, validBackUrl, (req, res) => {
  const back =
    req.locals && req.locals.back ? req.locals.back : { url: '/groundhogs', text: 'All groundhogs' }

  const groundhog = getGroundhogBySlug(req.params.slug, { oldestFirst: false })

  // count
  const countPredictions = groundhog.predictions.length
  // only 5 latest predictions
  groundhog.predictions = groundhog.predictions.slice(0, 5)

  res.render('pages/groundhog', {
    title: `${groundhog.name} from ${groundhog.city}, ${groundhog.region}`,
    groundhog,
    year: getGroundhogDayYear(),
    isBeforeGroundhogDay: BEFORE_GROUNDHOG_DAY || IS_GROUNDHOG_DAY,
    countPredictions,
    successor: groundhog.successor && getGroundhogBySlug(groundhog.successor),
    randomPositiveAdjective: getRandomPositiveAdjective(),
    pageMeta: _getPageMeta(req, {
      description: getGroundhogMetaDescription(groundhog),
      slug: groundhog.slug,
      speakable: true,
    }),
    back,
  })
})

/* GET single groundhog */
router.get('/groundhogs/:slug/predictions', validSlug, (req, res) => {
  // years == all years (including nulls), total == all predictions (nulls are not included)
  let allPredictions = { years: 0, total: 0, shadow: 0, noShadow: 0, null: 0 }

  let groundhog = getGroundhogBySlug(req.params.slug, { oldestFirst: false })
  groundhog['predictions'].forEach((p) => {
    ++allPredictions['years']

    p.shadow === 1
      ? ++allPredictions['shadow'] && ++allPredictions['total']
      : p.shadow === 0
        ? ++allPredictions['noShadow'] && ++allPredictions['total']
        : ++allPredictions['null']
  })

  const firstYear = groundhog.predictions[groundhog.predictions.length - 1].year

  allPredictions = {
    ...allPredictions,
    percent: {
      shadow: getPercent(allPredictions.shadow, allPredictions.total),
      noShadow: getPercent(allPredictions.noShadow, allPredictions.total),
    },
  }

  res.render('pages/groundhog_predictions', {
    title: `${groundhog.shortname}’s Predictions`,
    groundhog,
    allPredictions,
    firstYear,
    pageMeta: _getPageMeta(req, {
      description: getGroundhogMetaDescription(groundhog, {
        allPredictionsCount: allPredictions.total,
        firstYear,
      }),
      slug: groundhog.slug,
    }),
  })
})

/* get groundhogs and then spit them out on the map */
router.get('/map', validBackUrl, function (req, res) {
  const back = req.locals && req.locals.back ? req.locals.back : { url: '/', text: 'Home' }

  const groundhogs = getGroundhogs({ oldestFirst: true, isActive: true })
  const totals = {
    all: groundhogs.length,
    usa: 0,
    canada: 0,
  }

  groundhogs.map((g) => {
    // add latestPrediction to all groundhogs
    const { shadow } = g.predictions[g.predictions.length - 1]
    g['latestPrediction'] = shadow === null ? '' : shadow ? 'winter' : 'spring'

    // update totals
    totals[g.country.toLowerCase()]++
  })

  // sort groundhogs by name
  groundhogs.sort((a, b) => a.name.localeCompare(b.name))

  const groundhog = groundhogs.find((g) => g.slug === req.query.groundhog)

  res.render('pages/map', {
    title: 'Groundhog Map',
    pageMeta: _getPageMeta(req, {
      description:
        'Find your closest Groundhog Day prognosticator on an interactive map of all groundhogs across USA and Canada.',
    }),
    groundhogs,
    initial: groundhog ? groundhog.id : '',
    totals,
    back,
  })
})

// Import the express-openapi-validator library
const OpenApiValidator = require('express-openapi-validator')

const spec = path.join(__dirname, '../../reference/Groundhog-Day-API.v1.yaml')

APIRouter.use(
  OpenApiValidator.middleware({
    apiSpec: spec,
    validateRequests: true, // (default)
    validateResponses: true, // false by default
  }),
)

APIRouter.get('/', function (req, res) {
  res.json({
    message: 'Hello! Welcome to the Groundhog Day API: the leading Groundhog Day data source',
    _links: {
      self: { href: 'https://groundhog-day.com/api/v1/' },
      groundhogs: { href: 'https://groundhog-day.com/api/v1/groundhogs' },
      groundhog: { href: 'https://groundhog-day.com/api/v1/groundhogs/wiarton-willie' },
      predictions: {
        href: `https://groundhog-day.com/api/v1/predictions?year=${getGroundhogDayYear()}`,
      },
      spec: { href: 'https://groundhog-day.com/api/v1/spec' },
    },
  })
})

// Serve the OpenAPI spec
APIRouter.get('/spec', function (req, res) {
  res.download(spec, 'Groundhog-Day-API.v1.yaml')
})

/* get groundhogs as JSON */
APIRouter.get('/groundhogs', function (req, res) {
  let country = undefined
  if (req.query.country) {
    country =
      req.query.country.toLowerCase() === 'canada'
        ? 'Canada'
        : req.query.country.toLowerCase() === 'usa'
          ? 'USA'
          : undefined
  }

  const isGroundhog = parseBoolean(req.query.isGroundhog)
  const isActive = parseBoolean(req.query.isActive)
  const groundhogs = getGroundhogs({ oldestFirst: true, country, isGroundhog, isActive })
  res.json({ groundhogs })
})

/* get a single groundhog as JSON by id */
APIRouter.get('/groundhogs/id/:gId', validId, function (req, res) {
  const groundhog = getGroundhogById(req.params.gId, { oldestFirst: true })
  res.json({ groundhog })
})

/* get a single groundhog as JSON by slug */
APIRouter.get('/groundhogs/:slug', validSlug, function (req, res) {
  const groundhog = getGroundhogBySlug(req.params.slug, { oldestFirst: true })
  res.json({ groundhog })
})

/* get predictions for a single year as JSON */
APIRouter.get('/predictions', redirectAPIYear, validYear, function (req, res) {
  let predictions = getPredictionsByYear(req.query.year)
  res.json({ predictions })
})

/* API not found error responses */
APIRouter.get('/*splat', (req, res) => {
  res.status(404)
  throw new createError(404, `Error: Could not find route “${req.path}”`)
})

// eslint-disable-next-line no-unused-vars
APIRouter.use(function (err, req, res, next) {
  const status = err.status || res.statusCode
  return res.status(status).send({
    error: {
      status,
      message: err.toString() || err.message,
      timestamp: new Date(Date.now()).toISOString(),
    },
  })
})

module.exports = { router, APIRouter }
