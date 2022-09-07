const fs = require('fs')
const path = require('path')
const csv = require('fast-csv')
const { escape, isBoolean } = require('./utils')

const migrationsStart = `-- Up
CREATE TABLE groundhogs (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  shortname TEXT,
  name TEXT,
  city TEXT,
  region TEXT,
  country TEXT,
  source TEXT,
  contact TEXT,
  currentPrediction TEXT,
  isGroundhog BOOLEAN,
  type TEXT,
  active BOOLEAN,
  description TEXT
);

CREATE TABLE predictions (
  id INTEGER PRIMARY KEY,
  slug TEXT,
  year INTEGER,
  shadow BOOLEAN,
  details TEXT,
  FOREIGN KEY(slug) REFERENCES groundhogs(slug),
  UNIQUE (slug, year)
);
`

const migrationsEnd = `
-- Down
DROP TABLE IF EXISTS predictions;
DROP TABLE IF EXISTS groundhogs;
`

/* eslint-disable no-console */

const insertMigrationsStart = () => {
  return new Promise(function (resolve) {
    const stream = fs.createWriteStream('./migrations/001-init.sql')
    stream.write(migrationsStart)

    // end stream
    stream.end()
    console.log('start')
    resolve()
  })
}

/* Insert groundhogs */

const insertGroundhogs = () => {
  return new Promise(function (resolve, reject) {
    const stream = fs.createWriteStream('./migrations/001-init.sql', { flags: 'a' })
    stream.write('\n/* Insert Groundhogs */\n')

    fs.createReadStream(path.resolve(__dirname, '../csv', 'groundhogs.csv'))
      .pipe(csv.parse({ headers: true }))
      .on('error', (error) => {
        console.error(error)
        reject(error)
      })
      .on('data', (row) => {
        const insert = `INSERT INTO groundhogs (id, slug, shortname, name, city, region, country, source, contact, currentPrediction, isGroundhog, type, active, description) VALUES (${parseInt(
          row.id,
        )}, '${escape(row.slug)}', '${escape(row.shortname)}', '${escape(row.name)}', '${escape(
          row.city,
        )}', '${escape(row.region)}', '${escape(row.country)}', '${escape(row.source)}', '${escape(
          row.contact,
        )}', '${escape(row.currentPrediction)}', ${isBoolean(row.isGroundhog)}, '${escape(
          row.type,
        )}', '${isBoolean(row.active)}', '${escape(row.description)}');\n`

        stream.write(insert)
      })
      .on('end', (rowCount) => {
        console.log(`Inserted ${rowCount} groundhogs`)
        stream.end()
        resolve()
      })
  })
}

const insertPredictions = () => {
  return new Promise(function (resolve) {
    const filenames = fs
      .readdirSync(path.resolve(__dirname, '../csv/predictions'))
      .filter((f) => f.endsWith('.csv'))

    const stream = fs.createWriteStream('./migrations/001-init.sql', { flags: 'a' })
    stream.write('\n/* Insert Predictions */\n')

    /* Insert predictions */
    filenames.map((filename) => {
      const [slug] = filename.split('.')
      fs.createReadStream(path.resolve(__dirname, '../csv/predictions', filename))
        .pipe(csv.parse({ headers: true }))
        .on('error', (error) => console.error(error))
        .on('data', (row) => {
          const insert = `INSERT INTO predictions (slug, year, shadow, details) VALUES ('${escape(
            slug,
          )}', ${parseInt(row.year)}, ${isBoolean(row.shadow)}, '${escape(row.details)}');\n`

          stream.write(insert)
        })
        .on('end', (rowCount) => {
          console.log(`Parsed ${rowCount} rows`)

          if (filename === filenames[filenames.length - 1]) {
            stream.end()
            resolve()
          }
        })
    })
    console.log(filenames)
  })
}

const insertMigrationsEnd = () => {
  return new Promise(function (resolve) {
    const stream = fs.createWriteStream('./migrations/001-init.sql', { flags: 'a' })
    stream.write(migrationsEnd)

    // end stream
    stream.end()
    console.log('done')
    resolve()
  })
}

/* eslint-enable no-console */

insertMigrationsStart()
  .then(() => insertGroundhogs())
  .then(() => insertPredictions())
  .then(() => insertMigrationsEnd())
