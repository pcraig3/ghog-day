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
const getPredictionsByYear = (year) =>
  DB().prepare('SELECT * FROM predictions WHERE year = ?;').all(year)

const getPredictionsByGroundhog = (id) =>
  DB().prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;').all(id)

const getGroundhogs = () =>
  DB()
    .prepare(
      `
    SELECT groundhogs.*, COUNT(ghogId) AS ghogCount 
    FROM groundhogs LEFT JOIN predictions
    ON groundhogs.id = predictions.ghogId
    GROUP BY groundhogs.id
    ORDER BY ghogCount DESC;
  `,
    )
    .all()

const getGroundhogById = (id) => DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(id)

const getGroundhogById2 = (id) => {
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
        SELECT json_group_array(
          json_object(
            'year', p.year,
            'shadow', p.shadow,
            'details', p.details
          )
        )
        FROM predictions AS p
        WHERE p.ghogId = g.id
      )
    ) AS groundhog
    FROM groundhogs AS g
    WHERE id = ?;`,
    )
    .get(id)

  return JSON.parse(groundhog)
}

/* Middleware */
const validYear = (req, res, next) => {
  const year = parseInt(req.params.year)

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

  let groundhogs = getGroundhogs()
  let groundhogsArr = []

  // create array where groundhog ids are also the index
  groundhogs.forEach((ghog) => {
    groundhogsArr[ghog.id] = ghog
  })

  // add groundhog to each prediction
  predictions.forEach((prediction) => {
    prediction.groundhog = groundhogsArr[prediction.ghogId]
    delete prediction.ghogId
    delete prediction.id

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
  let groundhogs = getGroundhogs()
  let predictions = []
  const recentPredictions = { total: 0, winter: 0, spring: 0 }

  // add predictions to groundhogs
  groundhogs.forEach((g) => {
    predictions = getPredictionsByGroundhog(g.id)

    g['predictionsCount'] = predictions.length
    g['latestPrediction'] = predictions[predictions.length - 1]

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
  let groundhog = getGroundhogById2(req.params.gId)
  // assign earliest prediction year as separate attribute
  groundhog['earliestPrediction'] = groundhog['predictions'][0]['year']

  // reverse predictions order
  groundhog['predictions'].reverse()

  res.render('pages/groundhog', { title: groundhog.name, groundhog })
})

/* GET single groundhog */
router.get('/groundhogs/:gId/predictions', validId, (req, res) => {
  let allPredictions = { total: 0, shadow: 0, noShadow: 0, null: 0 }

  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)
  const predictions = getPredictionsByGroundhog(req.params.gId)

  groundhog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs) // eslint-disable-line no-unused-vars

  groundhog['predictions'].forEach((p) => {
    ++allPredictions['total']

    p.shadow === 1
      ? ++allPredictions['shadow']
      : p.shadow === 0
      ? ++allPredictions['noShadow'] // eslint-disable-line indent
      : ++allPredictions['null'] // eslint-disable-line indent
  })

  // reverse predictions order
  // groundhog['predictions'].reverse()

  res.render('pages/groundhog_predictions', {
    title: `${groundhog.shortname}’s Predictions`,
    groundhog,
    allPredictions: _calcPercentages(allPredictions),
  })
})

/* get groundhogs as JSON */
router.get('/api/v1/groundhogs', function (req, res) {
  let groundhogs = getGroundhogs()

  groundhogs.map((ghog) => {
    const predictions = getPredictionsByGroundhog(ghog['id'])

    // add predictions to groundhogs
    ghog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs) // eslint-disable-line no-unused-vars
  })

  res.send(groundhogs)
})

/* get a single groundhog as JSON */
router.get('/api/v1/groundhogs/:gId', validId, function (req, res) {
  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)
  const predictions = getPredictionsByGroundhog(req.params.gId)

  groundhog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs) // eslint-disable-line no-unused-vars

  res.send(groundhog)
})

/* get predictions for a single year as JSON */
router.get('/api/v1/predictions', function (req, res) {
  const currentYear = new Date().getFullYear()

  if (!req.query.year) {
    return res.redirect(`/api/v1/predictions?year=${currentYear}`)
  }

  if (req.query.year < 1886 || req.query.year > currentYear) {
    throw new createError(
      400,
      `The <code>year</code> must be between 1886 and ${currentYear} (inclusive).`,
    )
  }

  let predictions = getPredictionsByYear(req.query.year)

  let groundhogs = getAllGroundhogs()
  let groundhogsArr = []

  // create array where groundhog ids are also the index
  groundhogs.forEach((ghog) => {
    groundhogsArr[ghog.id] = ghog
  })

  // add groundhog to each prediction
  predictions.forEach((prediction) => {
    prediction.groundhog = groundhogsArr[prediction.ghogId]
    delete prediction.ghogId
    delete prediction.id
  })

  res.send(predictions)
})

module.exports = router
