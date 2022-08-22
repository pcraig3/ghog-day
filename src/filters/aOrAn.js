const aOrAn = (str = '') => {
  const vowels = ['a', 'e', 'i', 'o', 'u']

  // if not a string or it doesn't start with a vowel
  if (typeof str !== 'string' || !vowels.includes(str.charAt(0).toLowerCase())) {
    return 'a'
  }

  return 'an'
}

module.exports = aOrAn
