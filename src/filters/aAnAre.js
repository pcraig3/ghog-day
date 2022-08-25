const aAnAre = (str = '') => {
  const vowels = ['a', 'e', 'i', 'o', 'u']

  // if  a string and it sends with "hogs"
  if (typeof str === 'string' && str.endsWith('hogs')) {
    return 'are'
  }

  // if a string or it starts with a vowel
  if (typeof str === 'string' && vowels.includes(str.charAt(0).toLowerCase())) {
    return 'is an'
  }

  return 'is a'
}

module.exports = aAnAre
