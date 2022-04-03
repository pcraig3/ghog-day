var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')

/* Utils */
function _getPercent(percent, total) {
  return Math.round((percent / total) * 100)
}

/* GET home page. */
router.get('/', function (req, res) {
  res.render('index', { title: 'Groundhog Day.com' })
})

/* GET all groundhogs */
router.get('/groundhogs', function (req, res) {
  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()
  let predictions = []
  const recentPredictions = { total: 0, winter: 0, spring: 0, winterPercent: 0, springPercent: 0 }

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

  // calculate percentages for spring vs. winter predictions
  recentPredictions['winterPercent'] = _getPercent(
    recentPredictions['winter'],
    recentPredictions['total'],
  )
  recentPredictions['springPercent'] = _getPercent(
    recentPredictions['spring'],
    recentPredictions['total'],
  )

  res.render('groundhogs', { title: 'Groundhogs', groundhogs, recentPredictions })
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

/* GET predictions as json */
router.get('/predictions', function (req, res) {
  let rows = DB().query('SELECT * FROM predictions')
  res.send(rows)
})

/* get groundhogs as JSON */
router.get('/api', function (req, res) {
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

module.exports = router
