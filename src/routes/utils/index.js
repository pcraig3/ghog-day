var { getDayOfYear } = require('date-fns/getDayOfYear')

// Get current _groundhog_ year
// Until Feb 2, this should still read the past year
/* eslint-disable */
const getCurrentYear = () => {
  // TODO: remove

  const date = new Date()
  const dayOfYear = getDayOfYear(date)

  // 31 days in January + 1st day of Feb
  if (dayOfYear <= 32) {
    return date.getFullYear() - 1
  }

  return date.getFullYear()
}
/* eslint-enable */

const getDaysToGroundhogDay = () => {
  const nextYear = getCurrentYear() + 1
  const diffInMs = new Date(`${nextYear}-02-02T00:01:00`) - new Date()
  return Math.ceil(diffInMs / (1000 * 60 * 60 * 24))
}

// escape HTML-y looking strings
const escapeHtml = (unsafe) => {
  if (typeof unsafe !== 'string') return unsafe

  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;')
}

// return a percent as a rounded integet between 0-100
const getPercent = (percent, total) => {
  return Math.round((percent / total) * 100)
}

// https://bobbyhadz.com/blog/javascript-get-multiple-random-elements-from-array
const getRandomItems = (arr, { length = 3 } = {}) => {
  const shuffled = [...arr].sort(() => 0.5 - Math.random())
  return shuffled.slice(0, length)
}

// parse "1" "true" "TRUE" from query params. Return 1 for true, 0 for false, or undefined
const parseBoolean = (value) => {
  if (!value) {
    return undefined
  }

  const yes = ['1', 'true']
  const no = ['0', 'false']

  value = value.toLowerCase()

  return yes.includes(value) ? 1 : no.includes(value) ? 0 : undefined
}

// https://gist.github.com/jens1101/9f3faa6c2dae23537257f1c3d0afdfdf
const removeTrailingSlashes = (url) => url.replace(/\/+$/, '')

module.exports = {
  getCurrentYear,
  getDaysToGroundhogDay,
  escapeHtml,
  getPercent,
  getRandomItems,
  parseBoolean,
  removeTrailingSlashes,
}
