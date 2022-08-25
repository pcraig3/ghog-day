// var fs = require('fs').promises
var fs = require('fs')
var path = require('path')
var { parse } = require('csv-parse/sync')
var { stringify } = require('csv-stringify')

const newYear = (year) => {
  return { year, shadow: 'null', details: '' }
}

const filenames = fs
  .readdirSync(path.resolve(__dirname, './predictions'))
  .filter((f) => f.endsWith('.csv'))

console.log(filenames)

filenames.forEach((filename) => addYearsCSV(filename))

function addYearsCSV(filename) {
  const fileContent = fs.readFileSync(__dirname + `/predictions/${filename}`)
  const records = parse(fileContent, { columns: true })

  // cast all the years to ints
  records.forEach((r) => (r.year = parseInt(r.year)))

  firstYear = records[0].year
  lastYear = records[records.length - 1].year

  let newRecords = []

  for (let i = firstYear; i <= lastYear; i++) {
    let temp
    if (records[0].year === i) {
      temp = records.shift()
    } else {
      console.log(filename, i)
      temp = newYear(i)
    }

    newRecords.push(temp)
  }

  stringify(
    newRecords,
    {
      header: true,
    },
    function (err, output) {
      fs.writeFileSync(__dirname + `/predictions-new/${filename}`, output)
    },
  )
}
