const cleanUrl = require('../cleanUrl')

describe('CleanUrl ui responses', () => {
  test('it should return the original string if not a URL', async () => {
    expect(cleanUrl('hello')).toEqual('hello')
  })

  test('it should return an empty string if nothing is passed in', async () => {
    expect(cleanUrl()).toEqual('')
  })

  test('it should return an original value if not a string', async () => {
    expect(cleanUrl(1)).toEqual(1)
  })

  test('it should return an anchor tag for an http domain', async () => {
    expect(cleanUrl('http://canada-holidays.ca')).toEqual(
      '<a href="http://canada-holidays.ca/" target="_blank" class="underline">http://canada-holidays.ca</a>',
    )
  })

  test('it should return an anchor tag for an https domain', async () => {
    expect(cleanUrl('https://canada-holidays.ca')).toEqual(
      '<a href="https://canada-holidays.ca/" target="_blank" class="underline">https://canada-holidays.ca</a>',
    )
  })

  test('it should return an anchor tag without the protocol for a longer link', async () => {
    expect(cleanUrl('https://portugalcleanandsafe.pt/en/passenger-locator-card')).toEqual(
      '<a href="https://portugalcleanandsafe.pt/en/passenger-locator-card" target="_blank" class="underline">portugalcleanandsafe.pt</a>',
    )
  })
})
