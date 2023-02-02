const request = require('supertest')
const cheerio = require('cheerio')

const app = require('../../../app.js')
// TODO const { getCurrentYear } = require('../utils')

const EARLIEST_RECORDED_PREDICTION = 1886
// TODO const CURRENT_YEAR = getCurrentYear()
const CURRENT_YEAR = 2023

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
      // expect($('h1').text()).toEqual('Only 135 days until Groundhog Day 2023.')
      expect($('meta[name="description"]').attr('content')).toMatch(
        'GROUNDHOG-DAY.com is the leading Groundhog Day data source: cataloging North America’s prognosticating animals and their yearly weather predictions.',
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
        'Punxsutawney Phil is a prognosticating Groundhog from Punxsutawney in Pennsylvania, USA. In 2023, Phil did not make a prediction.',
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
        'See and compare groundhog predictions by year, from 2023 back to 1886 (which was before TikTok).',
      )
      expect($('link[rel="canonical"]').attr('href')).toMatch('/predictions')

      expect($('tbody tr').first().find('a').text()).toEqual(`${CURRENT_YEAR}`)
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
    test('it should return 302', async () => {
      const response = await request(app).get('/groundhog-day-2023')
      expect(response.statusCode).toBe(302)
      expect(response.headers.location).toBe('/predictions/2023')
    })
  })

  describe('Test /map response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/map')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/map')
      const $ = cheerio.load(response.text)

      expect($('title').text()).toEqual('Groundhog Map — GROUNDHOG-DAY.com')
      expect($('h1').text()).toEqual('Groundhog Map')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'Find your closest groundhog on an interactive map of North America (unless you’re from Saskatchewan).',
      )
      expect($('meta[property="og:image"]').attr('content')).toMatch('/images/map.jpeg')
      expect($('link[rel="canonical"]').attr('href')).toMatch('/map')
    })

    describe('query param ?groundhog', () => {
      test('empty: HTML attribute should be empty', async () => {
        const response = await request(app).get('/map?groundhog')
        expect(response.statusCode).toBe(200)

        const $ = cheerio.load(response.text)
        expect($('#sortable--map').attr('data-initial')).toBe('')
      })

      test('bad value: HTML attribute should be empty', async () => {
        const response = await request(app).get('/map?groundhog=grand-theft-auto-gary')
        expect(response.statusCode).toBe(200)

        const $ = cheerio.load(response.text)
        expect($('#sortable--map').attr('data-initial')).toBe('')
      })

      test('good value: should find groundhog ID in HTML attribute', async () => {
        const response = await request(app).get('/map?groundhog=wiarton-willie')
        expect(response.statusCode).toBe(200)

        const $ = cheerio.load(response.text)
        expect($('#sortable--map').attr('data-initial')).toMatch('3')
      })
    })
  })
})

// TEST API responses
describe('Test API responses', () => {
  describe('Verify CORS headers', () => {
    const corsUrls = [
      '/api',
      '/api/fake',
      '/api/v1/',
      '/api/v1/spec',
      '/api/v1/groundhogs',
      '/api/v1/predictions?year=2022',
    ]
    corsUrls.map((url) => {
      test(`"${url}" should return a CORS header`, async () => {
        const response = await request(app).get(url)
        expect(response.headers['access-control-allow-origin']).toEqual('*')
      })
    })
  })

  describe('Test /api/spec response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/api/v1/spec')
      expect(response.statusCode).toBe(200)
      expect(response.headers['content-disposition']).toEqual(
        'attachment; filename="Groundhog-Day-API.v1.yaml"',
      )
      expect(response.headers['content-type']).toEqual('text/yaml; charset=UTF-8')
      expect(response.text).toMatch(/openapi: 3.0.0/)
    })
  })

  describe('Test /api response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/api')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, and meta tag', async () => {
      const response = await request(app).get('/api')
      const $ = cheerio.load(response.text)
      expect($('h1').text()).toEqual('Groundhog Day API')
      expect($('title').text()).toEqual('Groundhog Day API — GROUNDHOG-DAY.com')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'A free JSON API for North America’s prognosticating animals and their yearly weather predictions.',
      )
    })
  })

  test('for /api/v1/* not found path a 404 status', async () => {
    const response = await request(app).get('/api/v1/marmots')
    expect(response.statusCode).toBe(404)

    let { error } = JSON.parse(response.text)
    expect(error).toMatchObject({
      message: 'Not Found: not found',
      status: response.statusCode,
      timestamp: expect.any(String),
    })
  })

  test('for /api/v1/ path it should return a message ', async () => {
    const response = await request(app).get('/api/v1/')
    expect(response.statusCode).toBe(200)

    let json = JSON.parse(response.text)
    expect(json.message).toMatch(/Hello! Welcome to the Groundhog Day API/)
    expect(Object.keys(json._links)).toEqual([
      'self',
      'groundhogs',
      'groundhog',
      'predictions',
      'spec',
    ])
  })

  describe('for /api/v1/groundhogs path', () => {
    const GROUNDHOGS_ALL = 66
    const GROUNDHOGS_CANADA = 12
    const GROUNDHOGS_USA = 54
    const GROUNDHOGS_ALTERNATIVE = 38

    const urls = [
      {
        path: '/api/v1/groundhogs',
        total: GROUNDHOGS_ALL,
      },
      {
        path: '/api/v1/groundhogs/', // extra trailing slash and it still works
        total: GROUNDHOGS_ALL,
      },
      {
        path: '/api/v1/groundhogs?country=canada',
        total: GROUNDHOGS_CANADA,
      },
      {
        path: '/api/v1/groundhogs?country=usa',
        total: GROUNDHOGS_USA,
      },
      {
        path: '/api/v1/groundhogs?country=portugal',
        total: GROUNDHOGS_ALL,
      },
      {
        path: '/api/v1/groundhogs?isGroundhog=false',
        total: GROUNDHOGS_ALTERNATIVE,
      },
    ]

    urls.map((url) => {
      test(`it should return ${url.total} groundhogs for path: "${url.path}"`, async () => {
        const response = await request(app).get(url.path)
        expect(response.statusCode).toBe(200)

        let { groundhogs } = JSON.parse(response.text)
        expect(groundhogs.length).toBe(url.total)
      })
    })
  })

  describe('for /api/v1/groundhogs/:id path', () => {
    const wiartonWillie = {
      id: 3,
      slug: 'wiarton-willie',
      shortname: 'Willie',
      name: 'Wiarton Willie',
      city: 'Wiarton',
      region: 'Ontario',
      country: 'Canada',
      predictions: expect.any(Array),
    }

    test('it should return a groundhog for a good string ID: "wiarton-willie"', async () => {
      const response = await request(app).get('/api/v1/groundhogs/wiarton-willie')
      expect(response.statusCode).toBe(200)

      let { groundhog } = JSON.parse(response.text)
      expect(groundhog).toMatchObject(wiartonWillie)
    })

    test('it should return a groundhog for a good integer ID: "3"', async () => {
      const response = await request(app).get('/api/v1/groundhogs/3')
      expect(response.statusCode).toBe(200)

      let { groundhog } = JSON.parse(response.text)
      expect(groundhog).toMatchObject(wiartonWillie)
    })

    const badIDs = ['murder-suicide-marvin', 'grand-larceny-gord', 0, 100]
    badIDs.map((id) => {
      test(`it should return an error message for a bad ID: ${id}`, async () => {
        const response = await request(app).get(`/api/v1/groundhogs/${id}`)
        expect(response.statusCode).toBe(400)

        let { error } = JSON.parse(response.text)

        const messageSuffix =
          typeof id === 'string' ? 'maybe you spelled it wrong?' : 'pick a real one.'

        expect(error).toMatchObject({
          message: `BadRequestError: Bad groundhog identifier ('${id}'), ${messageSuffix}`,
          status: response.statusCode,
          timestamp: expect.any(String),
        })
      })
    })
  })

  describe('for /api/v1/predictions path', () => {
    test('it should return a redirect if there is no year', async () => {
      const response = await request(app).get('/api/v1/predictions')
      expect(response.headers['location']).toEqual(`/api/v1/predictions?year=${CURRENT_YEAR}`)
      expect(response.statusCode).toBe(302)
    })

    test('it should return a good response for a good year', async () => {
      const response = await request(app).get(`/api/v1/predictions?year=${CURRENT_YEAR}`)
      expect(response.statusCode).toBe(200)

      let { predictions } = JSON.parse(response.text)
      expect(predictions).toMatchObject(expect.any(Array))
      expect(predictions[0].year).toEqual(CURRENT_YEAR)
    })

    test(`it should return an error for a too early year: "${
      EARLIEST_RECORDED_PREDICTION - 1
    }`, async () => {
      const response = await request(app).get(
        `/api/v1/predictions?year=${EARLIEST_RECORDED_PREDICTION - 1}`,
      )
      expect(response.statusCode).toBe(400)

      let { error } = JSON.parse(response.text)
      expect(error.status).toBe(400)
      expect(error.message).toBe('Bad Request: request/query/year must be >= 1886')
    })

    test(`it should return an error for a future year: "${CURRENT_YEAR + 1}`, async () => {
      const response = await request(app).get(`/api/v1/predictions?year=${CURRENT_YEAR + 1}`)
      expect(response.statusCode).toBe(400)

      let { error } = JSON.parse(response.text)
      expect(error.status).toBe(400)
      expect(error.message).toBe(
        "BadRequestError: The 'year' must be between 1886 and 2023 (inclusive).", // eslint-disable-line quotes
      )
    })
  })
})
