var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')

/* GET home page. */
router.get('/', function (req, res) {
  res.render('index', { title: 'Groundhog Day.com' })
})

/* GET groundhogs listing. */
router.get('/groundhogs', function (req, res) {
  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()
  const predictions = DB().prepare('SELECT * FROM predictions ORDER BY ghogId ASC;').all()
  const predictionsCount = {}

  // add predictions to groundhogs
  groundhogs.map((g) => (predictionsCount[g.id] = 0))
  predictions.map((p) => predictionsCount[p.ghogId]++)
  groundhogs.forEach((g) => (g['predictionsCount'] = predictionsCount[g.id]))

  res.render('groundhogs', { title: 'Groundhogs', groundhogs })
})

router.get('/groundhogs/:gId', (req, res) => {
  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)

  const predictions = DB()
    .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
    .all(req.params.gId)

  groundhog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs) // eslint-disable-line no-unused-vars
  groundhog['predictions'].reverse()

  res.render('groundhog', { title: groundhog.name, groundhog })
})

/* GET predictions listing. */
router.get('/predictions', function (req, res) {
  let rows = DB().query('SELECT * FROM predictions')
  res.send(rows)
})

/* get groundhogs */
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
