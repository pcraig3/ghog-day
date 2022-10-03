const createError = require('http-errors')
const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const nunjucks = require('nunjucks')
const helmet = require('helmet')
const DB = require('better-sqlite3-helper')
var cors = require('cors')

// The first call creates the global instance with your settings
DB({
  path: './data/sqlite3.db', // this is the default
  readonly: false, // read only
  fileMustExist: false, // throw error if database not exists
  WAL: false, // automatically enable 'PRAGMA journal_mode = WAL'
  migrate: {
    // disable completely by setting `migrate: false`
    force: 'last', // set to 'last' to automatically reapply the last migration-file
    table: 'migration', // name of the database table that is used to keep track
    migrationsPath: './migrations', // path of the migration-files
  },
})

const app = express()

const nunjucksEnvironment = nunjucks.configure(path.join(__dirname, './src/views'), {
  autoescape: true,
  express: app,
})

// TODO: remove this if it's not being used
nunjucksEnvironment.addFilter('cleanUrl', require('./src/filters/cleanUrl'))
nunjucksEnvironment.addFilter('aAnAre', require('./src/filters/aAnAre'))

const { router, APIRouter } = require('./src/routes/index')

// view engine setup
app.set('views', path.join(__dirname, './src/views'))
app.set('view engine', 'njk')

app.use((req, res, next) => {
  // add current route to templates
  app.locals.path = req.path

  // add (optional) github sha to templates
  app.locals.GITHUB_SHA = process.env.GITHUB_SHA

  // add the node env to the templates
  app.locals.NODE_ENV = process.env.NODE_ENV

  next()
})

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))
app.use(helmet({ contentSecurityPolicy: false }))
app.use(cors())

app.use('/', router)
app.use('/api/v1', APIRouter)

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404))
})

// error handler
// eslint-disable-next-line no-unused-vars
app.use(function (err, req, res, next) {
  let h1 = 'Server error'
  let message =
    err.message ||
    'Something went wrong. No cause for alarm. Contact paul@pcraig3 if you think you found a bug.'

  // only provide error stack in development
  let stack = req.app.get('env') === 'development' ? err.stack : ''

  if (err.status === 404) {
    h1 = 'Not ‘found’hog'
    message =
      'Do you get it? It is a marmot-themed pun. (Very lol. <span aria-hidden="true">🤓</span>)'
  } else if (err.status >= 400 && err.status < 500) {
    h1 = 'Prognosis impossible'
  }

  // render the error page
  const status = err.status || 500
  res.status(status)
  res.render('error', { title: `${status}: ${h1}`, h1, message, status, stack })
})

module.exports = app
