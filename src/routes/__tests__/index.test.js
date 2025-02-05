const request = require('supertest')
const cheerio = require('cheerio')

const app = require('../../../app.js')
const { getGroundhogDayYear } = require('../utils')

const EARLIEST_RECORDED_PREDICTION = 1886
const CURRENT_YEAR = getGroundhogDayYear()

describe('Test ui responses', () => {
  describe('Test / response', () => {
    test('it should return 200', async () => {
      const response = await request(app).get('/')
      expect(response.statusCode).toBe(200)
    })

    test('it should return the h1, title, meta tag, and canonical link', async () => {
      const response = await request(app).get('/')
      const $ = cheerio.load(response.text)
      expect($('title').text()).toEqual('GROUNDHOG-DAY.com — The leading Groundhog Day data source')
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

      expect($('title').text()).toEqual(
        'Punxsutawney Phil from Punxsutawney, Pennsylvania — GROUNDHOG DAY',
      )
      expect($('h1').text()).toEqual('Punxsutawney Phil')
      expect($('meta[name="description"]').attr('content')).toMatch(
        'Punxsutawney Phil is a prognosticating Groundhog from Punxsutawney in Pennsylvania, USA.',
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

      expect($('title').text()).toEqual('All predictions by year — GROUNDHOG DAY')
      expect($('h1').text()).toEqual('All predictions by year')
      expect($('meta[name="description"]').attr('content')).toEqual(
        `See and compare Groundhog Day predictions by year, from ${CURRENT_YEAR} back to 1886 (which was before TikTok).`,
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

          expect($('title').text()).toMatch(`Groundhog Day ${year.year}`)
          expect($('h1').text()).toEqual(`Groundhog Day ${year.year} results`)
          expect($('link[rel="canonical"]').attr('href')).toMatch(`/predictions/${year.year}`)
        })
      }
    })
  })

  describe('Test redirects responses', () => {
    const redirectUrls = [
      { path: '/groundhog-day-2023', redirect: '/predictions/2023' },
      { path: '/groundhog-day-2024', redirect: '/predictions/2024' },
      { path: '/groundhog-day-2025', redirect: '/predictions/2025' },
      { path: '/predictions/2026', redirect: '/groundhog-day-2026', code: 302 },
      {
        path: '/groundhogs/sylvia-the-armadillo',
        redirect: '/groundhogs/sylvia-the-apex-armadillo',
      },
    ]

    redirectUrls.map((redirectUrl) => {
      test(`it should redirect ${redirectUrl.path} to: "${redirectUrl.redirect}"`, async () => {
        const response = await request(app).get(redirectUrl.path)
        const expectedStatusCode = redirectUrl.code || 301
        expect(response.statusCode).toBe(expectedStatusCode)
        expect(response.headers.location).toBe(redirectUrl.redirect)
      })
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

      expect($('title').text()).toEqual('Groundhog Map — GROUNDHOG DAY')
      expect($('h1').text()).toEqual('Groundhog Map')
      expect($('meta[name="description"]').attr('content')).toEqual(
        'Find your closest Groundhog Day prognosticator on an interactive map of all groundhogs across USA and Canada.',
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
      expect($('title').text()).toEqual('Groundhog Day API — GROUNDHOG DAY')
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
    const GROUNDHOGS_ALL = 88
    const GROUNDHOGS_CANADA = 14
    const GROUNDHOGS_USA = 74
    const GROUNDHOGS_ALTERNATIVE = 51
    const GROUNDHOGS_ACTIVE = 78

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
      {
        path: '/api/v1/groundhogs?isActive=true',
        total: GROUNDHOGS_ACTIVE,
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

    const badIDs = [0, 100]
    badIDs.map((id) => {
      test(`it should return an error message for a bad ID: ${id}`, async () => {
        const response = await request(app).get(`/api/v1/groundhogs/${id}`)
        expect(response.statusCode).toBe(400)

        let { error } = JSON.parse(response.text)

        expect(error).toMatchObject({
          message: `BadRequestError: Bad groundhog identifier ('${id}'), pick a real one.`,
          status: response.statusCode,
          timestamp: expect.any(String),
        })
      })
    })

    const badSlugs = ['murder-suicide-marvin', 'grand-larceny-gord']
    badSlugs.map((slug) => {
      test(`it should return an error message for a bad slug: ${slug}`, async () => {
        const response = await request(app).get(`/api/v1/groundhogs/${slug}`)
        expect(response.statusCode).toBe(400)

        let { error } = JSON.parse(response.text)

        expect(error).toMatchObject({
          message: `BadRequestError: No groundhog for ‘${slug}’. Maybe you want to <a class="underline" href="/add-groundhog">add a groundhog?</a>`,
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

    test(`it should return an error for a future year: "${CURRENT_YEAR + 2}`, async () => {
      const response = await request(app).get(`/api/v1/predictions?year=${CURRENT_YEAR + 2}`)
      expect(response.statusCode).toBe(400)

      let { error } = JSON.parse(response.text)
      expect(error.status).toBe(400)
      expect(error.message).toBe(
        "BadRequestError: The 'year' must be between 1886 and 2025 (inclusive).", // eslint-disable-line quotes
      )
    })
  })
})
