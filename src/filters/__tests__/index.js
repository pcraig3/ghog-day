const aAnAre = require('../aAnAre')

describe('aAnAre', () => {
  it('should return "is a" if the input is not a string or does not start with a vowel', () => {
    expect(aAnAre()).toBe('is a')
    expect(aAnAre(123)).toBe('is a')
    expect(aAnAre('xyz')).toBe('is a')
  })

  it('should return "is an" if the input is a string that starts with a vowel', () => {
    expect(aAnAre('apple')).toBe('is an')
    expect(aAnAre('elephant')).toBe('is an')
  })

  it('should return "are" if the input is a string that ends with "hogs"', () => {
    expect(aAnAre('groundhogs')).toBe('are')
    expect(aAnAre('pigs hogs')).toBe('are')
  })
})
