var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')

/* GET home page. */
router.get('/', function (req, res) {
  const groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()
  const years = [2022, 2021, 2020, 2019, 2018]
  res.render('index', { groundhogs, years })
})

/* GET groundhogs listing. */
router.get('/groundhogs', function (req, res) {
  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()

  groundhogs.map((ghog) => {
    predictions = DB()
      .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
      .all(ghog['id'])

    ghog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs)
  })

  res.send(groundhogs)
})

router.get('/groundhogs/:gId', (req, res) => {
  let groundhog = DB().prepare('SELECT * FROM groundhogs WHERE id = ?;').get(req.params.gId)

  predictions = DB()
    .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
    .all(req.params.gId)

  groundhog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs)

  res.render('groundhog', { groundhog })
})

/* GET predictions listing. */
router.get('/predictions', function (req, res) {
  let rows = DB().query('SELECT * FROM predictions')
  res.send(rows)
})

module.exports = router
