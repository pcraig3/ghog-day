var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')
const createError = require('http-errors')

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

function _calcPercentages(obj = {}) {
  const { total } = obj
  if (!total) {
    return obj
  }

  const newObj = { ...obj }
  const percent = {}

  for (const property in newObj) {
    if (property !== 'total') {
      percent[property] = _getPercent(newObj[property], total)
    }
  }

  newObj['percent'] = percent

  return newObj
}

// https://bobbyhadz.com/blog/javascript-get-multiple-random-elements-from-array
function _getRandomItems(arr, { length = 3 } = {}) {
  const shuffled = [...arr].sort(() => 0.5 - Math.random())
  return shuffled.slice(0, length)
}

/* Queries */
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
        'shortname', g.shortname,
        'name', g.name,
        'city', g.city,
        'region', g.region,
        'country', g.country,
        'source', g.source,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'description', g.description
      ) AS gh
      FROM groundhogs AS g
      WHERE g.id = p.ghogId
    )) AS predictions
    FROM predictions AS p
    WHERE year = ?
    ORDER BY (SELECT Count(*) FROM predictions WHERE ghogId = p.ghogId) DESC;
  `,
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
        'shortname', g.shortname,
        'name', g.name,
        'city', g.city,
        'region', g.region,
        'country', g.country,
        'source', g.source,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'description', g.description
      ) AS gh
      FROM groundhogs AS g
      WHERE g.id = p.ghogId
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

const getGroundhogById = (id, { oldestFirst = false } = {}) => {
  const orderBy = oldestFirst ? 'ASC' : 'DESC'

  let groundhogObj = DB()
    .prepare(
      `
    SELECT json_object(
      'id', g.id,
      'shortname', g.shortname,
      'name', g.name,
      'city', g.city,
      'region', g.region,
      'country', g.country,
      'source', g.source,
      'currentPrediction', g.currentPrediction,
      'isGroundhog', g.isGroundhog,
      'type', g.type,
      'description', g.description,
      'predictions', (
        SELECT json_group_array(o)
        FROM (SELECT json_object(
              'year', p.year,
              'shadow', p.shadow,
              'details', p.details
            ) AS o
            FROM predictions AS p
            WHERE p.ghogId = g.id
            ORDER BY p.year ${orderBy}
        )
      )
    ) AS groundhog
    FROM groundhogs AS g
    WHERE id = ?;`,
    )
    .get(id)

  return groundhogObj ? JSON.parse(groundhogObj.groundhog) : groundhogObj
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
        'shortname', g.shortname,
        'name', g.name,
        'city', g.city,
        'region', g.region,
        'country', g.country,
        'source', g.source,
        'currentPrediction', g.currentPrediction,
        'isGroundhog', g.isGroundhog,
        'type', g.type,
        'description', g.description,
        'predictionsCount', (SELECT json_array_length(json_group_array(id)) FROM predictions WHERE ghogId=g.id),
        '${predictionKey}', (
          ${year ? '' : 'SELECT json_group_array(o) FROM ('}
          SELECT json_object(
                'year', p.year,
                'shadow', p.shadow,
                'details', p.details
              ) AS o
              FROM predictions AS p
              WHERE p.ghogId = g.id ${yearClause}
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
      `The <code>year</code> must be between ${EARLIEST_RECORDED_PREDICTION} and ${CURRENT_YEAR} (inclusive).`,
    )
  }

  next()
}

const validId = (req, res, next) => {
  const id = parseInt(req.params.gId)
  let groundhog

  if (!isNaN(id)) {
    groundhog = getGroundhogById(id)
  }

  if (!groundhog) {
    throw new createError(400, `Bad groundhog identifier (<code>${id}</code>), pick a real one.`)
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
    const { shadow, groundhog: { id, name, region, country } = {} } = p
    return {
      id,
      name,
      shadow,
      location: `${region}, ${country}`,
    }
  })

  res.render('pages/index', {
    title: 'GROUNDHOG-DAY.com',
    predictionResults,
    randomGroundhogs,
    totalGroundhogs,
  })
})

/* GET about page. */
router.get('/about', function (req, res) {
  res.render('pages/about', { title: 'About' })
})

/* GET api page. */
router.get('/api', function (req, res) {
  res.render('pages/api', { title: 'API' })
})

router.get('/predictions', function (req, res) {
  const _predictions = _getPredictions({ since: 1886 })
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

  res.render('pages/years', {
    title: 'Predictions by year',
    predictions: predictionResults,
  })
})

/* GET predictions page for a year. */
router.get('/predictions/:year', validYear, function (req, res) {
  const year = parseInt(req.params.year)
  const predictionTotals = { total: 0, winter: 0, spring: 0 }

  const years = {
    year,
    next: year === CURRENT_YEAR ? undefined : year + 1,
    prev: year === EARLIEST_RECORDED_PREDICTION ? undefined : year - 1,
  }

  let predictions = getPredictionsByYear(year)

  predictions.forEach((prediction) => {
    ++predictionTotals['total']
    prediction['shadow'] ? ++predictionTotals['winter'] : ++predictionTotals['spring']
  })

  res.render('pages/year', {
    title: `${year} predictions`,
    years,
    predictions,
    predictionTotals,
  })
})

/* GET all groundhogs */
router.get('/groundhogs', function (req, res) {
  let groundhogs = getGroundhogs({ year: CURRENT_YEAR })
  // sort groundhogs by "predictionsCount". This is an aggregate field so better do it here
  groundhogs.sort((a, b) => b.predictionsCount - a.predictionsCount)

  const recentPredictions = { total: 0, winter: 0, spring: 0 }
  groundhogs.forEach((g) => {
    ++recentPredictions['total']
    g['latestPrediction']['shadow'] ? ++recentPredictions['winter'] : ++recentPredictions['spring']
  })

  res.render('pages/groundhogs', {
    title: 'Groundhogs',
    groundhogs,
    recentPredictions: _calcPercentages(recentPredictions),
  })
})

/* GET single groundhog */
router.get('/groundhogs/:gId', validId, (req, res) => {
  let groundhog = getGroundhogById(req.params.gId)
  res.render('pages/groundhog', { title: groundhog.name, groundhog })
})

/* GET single groundhog */
router.get('/groundhogs/:gId/predictions', validId, (req, res) => {
  let allPredictions = { total: 0, shadow: 0, noShadow: 0, null: 0 }

  let groundhog = getGroundhogById(req.params.gId)
  groundhog['predictions'].forEach((p) => {
    ++allPredictions['total']

    p.shadow === 1
      ? ++allPredictions['shadow']
      : p.shadow === 0
      ? ++allPredictions['noShadow'] // eslint-disable-line indent
      : ++allPredictions['null'] // eslint-disable-line indent
  })

  res.render('pages/groundhog_predictions', {
    title: `${groundhog.shortname}’s Predictions`,
    groundhog,
    allPredictions: _calcPercentages(allPredictions),
  })
})

/* get groundhogs as JSON */
router.get('/api/v1/groundhogs', function (req, res) {
  const groundhogs = getGroundhogs({ oldestFirst: true })
  res.send(groundhogs)
})

/* get a single groundhog as JSON */
router.get('/api/v1/groundhogs/:gId', validId, function (req, res) {
  const groundhog = getGroundhogById(req.params.gId, { oldestFirst: true })
  res.send(groundhog)
})

/* get predictions for a single year as JSON */
router.get('/api/v1/predictions', redirectYear, validYear, function (req, res) {
  let predictions = getPredictionsByYear(req.query.year)

  res.send(predictions)
})

module.exports = router
