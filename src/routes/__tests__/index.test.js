const request = require('supertest')
// const DB = require('better-sqlite3-helper')
// const cheerio = require('cheerio')

const app = require('../../../app.js')
// const DBconfig = require('../../config/better-sqlite3-helper.config')

// // The first call creates the global instance with your settings
// DB(DBconfig)

describe('Test ui responses', () => {
  describe('Test / response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/')
      expect(response.text.replace(/\s+/g, '')).toContain(
        '<title>GROUNDHOG-DAY.com—theleadingGroundhogDaydatasource.</title>',
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
      expect(response.text.replace(/\s+/g, '')).toContain(
        '<title>PunxsutawneyPhil—GROUNDHOG-DAY.com</title>',
      )
    })
  })
})
