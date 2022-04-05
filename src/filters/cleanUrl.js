const cleanUrl = (str = '') => {
  // if not a string or doesn't begin with http, just return the value
  if (typeof str !== 'string' || !str.startsWith('http')) {
    return str
  }

  const url = new URL(str)
  const linkText = url.hostname.length >= 20 ? url.hostname : `${url.protocol}//${url.hostname}`

  return `<a href="${url.href}" target="_blank" class="underline">${linkText}</a>`
}

module.exports = cleanUrl
