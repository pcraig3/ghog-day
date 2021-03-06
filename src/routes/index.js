var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')
const createError = require('http-errors')

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

/* GET home page. */
router.get('/', function (req, res) {
  res.render('index', { title: 'GROUNDHOG-DAY.com' })
})

/* GET about page. */
router.get('/about', function (req, res) {
  res.render('about', { title: 'About – GROUNDHOG-DAY.com' })
})

/* GET api page. */
router.get('/api', function (req, res) {
  res.render('api', { title: 'API – GROUNDHOG-DAY.com' })
})

/* GET all groundhogs */
router.get('/groundhogs', function (req, res) {
  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()
  let predictions = []
  const recentPredictions = { total: 0, winter: 0, spring: 0 }

  // add predictions to groundhogs
  groundhogs.forEach((g) => {
    predictions = DB()
      .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
      .all(g.id)

    g['predictionsCount'] = predictions.length
    g['latestPrediction'] = predictions[predictions.length - 1]

    ++recentPredictions['total']
    g['latestPrediction']['shadow'] ? ++recentPredictions['winter'] : ++recentPredictions['spring']
  })

  res.render('groundhogs', {
    title: 'Groundhogs',
    groundhogs,
    recentPredictions: _calcPercentages(recentPredictions),
  })
})

/* GET single groundhog */
router.get('/groundhogs/:gId', (req, res) => {
  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)

  const predictions = DB()
    .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
    .all(req.params.gId)

  groundhog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs) // eslint-disable-line no-unused-vars

  // assign earliest prediction year as separate attribute
  groundhog['earliestPrediction'] = groundhog['predictions'][0]['year']

  // reverse predictions order
  groundhog['predictions'].reverse()

  res.render('groundhog', { title: groundhog.name, groundhog })
})

/* GET single groundhog */
router.get('/groundhogs/:gId/predictions', (req, res) => {
  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)
  let allPredictions = { total: 0, shadow: 0, noShadow: 0, null: 0 }

  const predictions = DB()
    .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
    .all(req.params.gId)

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

  res.render('predictions', {
    title: `${groundhog.shortname}’s Predictions`,
    groundhog,
    allPredictions: _calcPercentages(allPredictions),
  })
})

/* get groundhogs as JSON */
router.get('/api/v1/groundhogs', function (req, res) {
  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()

  groundhogs.map((ghog) => {
    const predictions = DB()
      .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
      .all(ghog['id'])

    // add predictions to groundhogs
    ghog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs) // eslint-disable-line no-unused-vars
  })

  res.send(groundhogs)
})

/* get a single groundhog as JSON */
router.get('/api/v1/groundhogs/:gId', function (req, res) {
  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)

  const predictions = DB()
    .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
    .all(req.params.gId)

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

  let predictions = DB().prepare('SELECT * FROM predictions WHERE year = ?;').all(req.query.year)

  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()
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
