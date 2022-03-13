var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')

/* GET groundhogs listing. */
router.get('/', function (req, res) {
  let groundhogs = DB().prepare('SELECT * FROM groundhogs ORDER BY id ASC;').all()

  groundhogs.map((ghog) => {
    predictions = DB()
      .prepare('SELECT * FROM predictions WHERE ghogId = ? ORDER BY year ASC;')
      .all(ghog['id'])

    ghog['predictions'] = predictions.map(({ ghogId, id, ...keepAttrs }) => keepAttrs)
  })

  res.send(groundhogs)
})

module.exports = router
