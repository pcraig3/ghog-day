const createError = require('http-errors')
const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const nunjucks = require('nunjucks')
const helmet = require('helmet')
const DB = require('better-sqlite3-helper')

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

nunjucksEnvironment.addFilter('cleanUrl', require('./src/filters/cleanUrl'))

const indexRouter = require('./src/routes/index')

// view engine setup
app.set('views', path.join(__dirname, './src/views'))
app.set('view engine', 'njk')

app.use((req, res, next) => {
  // add current route to templates
  app.locals.path = req.path

  // add (optional) github sha to templates
  app.locals.GITHUB_SHA = process.env.GITHUB_SHA

  next()
})

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))
app.use(helmet({ contentSecurityPolicy: false }))

app.use('/', indexRouter)

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404))
})

// error handler
app.use(function (err, req, res) {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get('env') === 'development' ? err : {}

  // render the error page
  res.status(err.status || 500)
  res.render('error')
})

module.exports = app
