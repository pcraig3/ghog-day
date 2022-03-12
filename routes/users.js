var express = require('express')
var router = express.Router()
const DB = require('better-sqlite3-helper')

/* GET users listing. */
router.get('/', function (req, res) {
  let rows = DB().query('SELECT * FROM users')
  console.log(rows)

  res.send(rows)
})

module.exports = router
