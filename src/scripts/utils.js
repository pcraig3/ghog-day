const hasShadow = (shadow = '') => {
  switch (shadow.toUpperCase()) {
    case 'TRUE':
      return 1
    case 'FALSE':
      return 0
    default:
      return null
  }
}

/**
 * Escape a string for insertion into a DB
 * From: https://stackoverflow.com/questions/7744912/making-a-javascript-string-sql-friendly
 * @param string str, an sql string
 * @returns string, a formatted string
 */
const escape = (str) => {
  if (typeof str != 'string') return str

  return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
    switch (char) {
      case '\0':
        return '\\0'
      case '\x08':
        return '\\b'
      case '\x09':
        return '\\t'
      case '\x1a':
        return '\\z'
      case '\n':
        return '\\n'
      case '\r':
        return '\\r'
      case '"':
      case "'":
      case '\\':
      case '%':
        return '\\' + char // prepends a backslash to backslash, percent,
      // and double/single quotes
    }
  })
}

module.exports = {
  hasShadow,
  escape,
}
