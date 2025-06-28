const fs = require('fs')
const path = require('path')
const { getDayOfYear } = require('date-fns/getDayOfYear')
const { imageSizeFromFile } = require('image-size/fromFile')

const getAbsoluteYear = () => {
  return new Date().getFullYear()
}

// Get current _groundhog_ year
// Until Feb 2, this should still read the past year
const getGroundhogDayYear = () => {
  const date = new Date()
  const dayOfYear = getDayOfYear(date)

  // 31 days in January + 1st day of Feb
  if (dayOfYear <= 32) {
    return date.getFullYear() - 1
  }

  return date.getFullYear()
}

const getDaysToGroundhogDay = () => {
  const nextYear = getGroundhogDayYear() + 1

  // February 2nd, 00:01 UTC
  const groundhogDay = new Date(`${nextYear}-02-02T00:01:00Z`)

  // Get the current date and adjust for PST (-8 hours)
  const now = new Date()
  now.setHours(now.getHours() - 8)

  // Calculate difference in days
  const diffInMs = groundhogDay - now
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

// return a percent as a rounded integer between 0-100
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

const getRandomPositiveAdjective = () => {
  const adjectives = [
    'amazing',
    'awesome',
    'brilliant',
    'excellent',
    'fabulous',
    'fantastic',
    'incredible',
    'magnificent',
    'marvelous',
    'outstanding',
    'phenomenal',
    'remarkable',
    'sensational',
    'terrific',
    'tremendous',
    'wonderful',
  ]

  return getRandomItems(adjectives, { length: 1 })[0]
}

const imageDir = path.resolve(__dirname, '../../../public/images/ghogs/og-image')
const imageSizeCache = {}

async function preloadImageSizes() {
  const files = fs.readdirSync(imageDir)
  for (const file of files) {
    if (file.endsWith('.jpeg')) {
      const slug = file.replace('.jpeg', '')
      const dimensions = await imageSizeFromFile(path.join(imageDir, file))
      imageSizeCache[slug] = dimensions
    }
  }
}

function getImageSize(slug) {
  return imageSizeCache[slug] || null
}

module.exports = {
  getAbsoluteYear,
  getGroundhogDayYear,
  getDaysToGroundhogDay,
  escapeHtml,
  getImageSize,
  getPercent,
  getRandomItems,
  getRandomPositiveAdjective,
  parseBoolean,
  preloadImageSizes,
  removeTrailingSlashes,
}
