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

const getGroundhogById = (id, { oldestFirst = false } = {}) => {
  const orderBy = oldestFirst ? 'ASC' : 'DESC'

  let { groundhog } = DB()
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

  return JSON.parse(groundhog)
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

  // TODO: better message
  if (!groundhog) {
    throw new createError(400, `Bad groundhog (${id}), pick a real one.`)
  }

  next()
}

/* GET home page. */
router.get('/', function (req, res) {
  res.render('pages/index', { title: 'GROUNDHOG-DAY.com' })
})

/* GET about page. */
router.get('/about', function (req, res) {
  res.render('pages/about', { title: 'About' })
})

/* GET api page. */
router.get('/api', function (req, res) {
  res.render('pages/api', { title: 'API' })
})

/* 301 REDIRECT to a predictions page with a year. */
router.get('/predictions', function (req, res) {
  const currentYear = new Date().getFullYear()
  return res.redirect(`/predictions/${currentYear}`)
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

  res.render('pages/predictions', {
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
router.get('/api/v1/predictions', function (req, res) {
  const currentYear = new Date().getFullYear()

  if (!req.query.year) {
    return res.redirect(`/api/v1/predictions?year=${currentYear}`)
  }

  let predictions = getPredictionsByYear(req.query.year)

  res.send(predictions)
})

module.exports = router
