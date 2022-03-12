const fs = require('fs')
const path = require('path')
const csv = require('fast-csv')

const stream = fs.createWriteStream('./migrations/001-init.sql')

const predictions = `-- Up
CREATE TABLE predictions (
  id INTEGER PRIMARY KEY,
  ghog_id INTEGER,
  year INTEGER,
  shadow BOOLEAN,
  details TEXT,
  UNIQUE (ghog_id, year)
);

INSERT INTO predictions (ghog_id, year, shadow, details) VALUES (1, 2020, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (ghog_id, year, shadow, details) VALUES (1, 2021, 0, 'No Shadow, Early Spring!');

-- Down
DROP TABLE IF EXISTS predictions;
`

stream.write(predictions)

// end stream
stream.end()

// fs.createReadStream(path.resolve(__dirname, '../csv', '1_phil.csv'))
//   .pipe(csv.parse({ headers: true }))
//   .on('error', (error) => console.error(error))
//   .on('data', (row) => {
//     console.log('here')
//     stream.write(`${row.year}`)
//   })
//   .on('end', (rowCount) => {
//     // end stream
//     stream.end()
//     console.log(`Parsed ${rowCount} rows`)
//   })
