const fs = require('fs')
const path = require('path')
const csv = require('fast-csv')
const stream = fs.createWriteStream('./migrations/001-init.sql')
const { escape, hasShadow } = require('./utils')

const migrationsStart = `-- Up
CREATE TABLE predictions (
  id INTEGER PRIMARY KEY,
  ghogId INTEGER,
  year INTEGER,
  shadow BOOLEAN,
  details TEXT,
  UNIQUE (ghogId, year)
);

/* Insert rows */
`

const migrationsEnd = `
-- Down
DROP TABLE IF EXISTS predictions;
`

stream.write(migrationsStart)

fs.createReadStream(path.resolve(__dirname, '../csv', '2_willie.csv'))
  .pipe(csv.parse({ headers: true }))
  .on('error', (error) => console.error(error))
  .on('data', (row) => {
    const insert = `INSERT INTO predictions (ghogId, year, shadow, details) VALUES (2, ${parseInt(
      row.year,
    )}, ${hasShadow(row.shadow)}, '${escape(row.details)}');\n`

    stream.write(insert)
  })
  .on('end', (rowCount) => {
    stream.write(migrationsEnd)

    // end stream
    stream.end()

    console.log(`Parsed ${rowCount} rows`)
  })
