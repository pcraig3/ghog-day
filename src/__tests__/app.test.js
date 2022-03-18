const request = require('supertest')
const app = require('../../app.js')

describe('Test server responses', () => {
  test('it should return 200 for the root path', async () => {
    const response = await request(app).get('/')
    expect(response.statusCode).toBe(200)
  })

  test('it should return 404 for a nonexistent path', async () => {
    const response = await request(app).get('/pterosaur')
    expect(response.statusCode).toBe(404)
  })

  test('it should NOT return security-focused headers in reponses', async () => {
    const response = await request(app).get('/')
    expect(response.headers['x-powered-by']).toEqual('Express')
  })
})
