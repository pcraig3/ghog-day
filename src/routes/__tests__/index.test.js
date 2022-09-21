const request = require('supertest')
// const DB = require('better-sqlite3-helper')
const cheerio = require('cheerio')

const app = require('../../../app.js')
// const DBconfig = require('../../config/better-sqlite3-helper.config')

// // The first call creates the global instance with your settings
// DB(DBconfig)

const EARLIEST_RECORDED_PREDICTION = 1886
// ~@TODO: This should actually be 2022 until Feb 2nd
const CURRENT_YEAR = new Date().getFullYear()

describe('Test ui responses', () => {
  describe('Test / response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/')
      const $ = cheerio.load(response.text)
      expect($('title').text()).toEqual('GROUNDHOG-DAY.com — the leading Groundhog Day data source')
      expect($('h1').text()).toEqual('Only 135 days until Groundhog Day 2023.')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'The leading data source for Groundhog Day, with more than 40 prognosticators spanning more than a century. Only 135 days until Groundhog Day 2023.',
      )
    })
  })

  describe('Test /groundhogs/punxsutawney-phil response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/groundhogs/punxsutawney-phil')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/groundhogs/punxsutawney-phil')
      const $ = cheerio.load(response.text)

      expect($('title').text()).toEqual('Punxsutawney Phil — GROUNDHOG-DAY.com')
      expect($('h1').text()).toEqual('Punxsutawney Phil')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'Punxsutawney Phil is a prognosticating Groundhog from Punxsutawney in Pennsylvania, USA. In 2022, Phil predicted a longer winter.',
      )
      expect($('link[rel="canonical"]').attr('href')).toMatch('/groundhogs/punxsutawney-phil')
    })
  })

  describe('Test /predictions response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/predictions')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/predictions')
      const $ = cheerio.load(response.text)

      expect($('title').text()).toEqual('Predictions by year — GROUNDHOG-DAY.com')
      expect($('h1').text()).toEqual('Predictions by year')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'See and compare groundhog predictions by year, from 2022 back to 1886 (which was before TikTok).',
      )
      expect($('link[rel="canonical"]').attr('href')).toMatch('/predictions')

      expect($('tbody tr').first().find('a').text()).toEqual(`${CURRENT_YEAR + 1}`)
      expect($('tbody tr').last().find('a').text()).toEqual(`${EARLIEST_RECORDED_PREDICTION}`)
    })
  })

  describe('Test /predictions/:years response', () => {
    const years = [
      { year: CURRENT_YEAR, status: 200 },
      { year: CURRENT_YEAR + 1, status: 302 },
      { year: CURRENT_YEAR + 2, status: 400 },
      { year: EARLIEST_RECORDED_PREDICTION, status: 200 },
      { year: EARLIEST_RECORDED_PREDICTION - 1, status: 400 },
    ]

    years.map((year) => {
      test(`For "${year.year}", it should return "${year.status}"`, async () => {
        const response = await request(app).get(`/predictions/${year.year}`)
        expect(response.statusCode).toBe(year.status)
      })

      if (year.status === 200) {
        test(`it should return the h1, title, and canonical link for year "${year.year}"`, async () => {
          const response = await request(app).get(`/predictions/${year.year}`)
          const $ = cheerio.load(response.text)

          expect($('title').text()).toEqual(`Groundhog Day ${year.year} — GROUNDHOG-DAY.com`)
          expect($('h1').text()).toEqual(`Groundhog Day ${year.year}`)
          expect($('link[rel="canonical"]').attr('href')).toMatch(`/predictions/${year.year}`)
        })
      }
    })
  })

  describe('Test /groundhog-day-2023 response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/groundhog-day-2023')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/groundhog-day-2023')
      const $ = cheerio.load(response.text)

      expect($('title').text()).toEqual('Groundhog Day 2023 — GROUNDHOG-DAY.com')
      expect($('h1').text()).toEqual('Groundhog Day 2023')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'In 2023, Groundhog Day will be on Thursday, February 2nd. Groundhog Day is not a statutory holiday in Canada or the USA.',
      )
      expect($('link[rel="canonical"]').attr('href')).toMatch('/groundhog-day-2023')
    })
  })
})
