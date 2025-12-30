const MarkdownIt = require('markdown-it')

const md = new MarkdownIt({
  html: false, // keep safe by default; set true if you explicitly want raw HTML
  linkify: true, // auto-link plain URLs
  breaks: false,
})

// Add target=_blank to external links (not groundhog-day, not #, not mailto:)
const defaultLinkOpen =
  md.renderer.rules.link_open ||
  function (tokens, idx, options, env, self) {
    return self.renderToken(tokens, idx, options)
  }

md.renderer.rules.link_open = function (tokens, idx, options, env, self) {
  const token = tokens[idx]
  const href = token.attrGet('href') || ''

  const isExcluded =
    href.includes('groundhog-day') || href.startsWith('#') || href.startsWith('mailto:')

  if (!isExcluded) {
    token.attrSet('target', '_blank')
  }

  return defaultLinkOpen(tokens, idx, options, env, self)
}

function mdFilter(value, stripPara) {
  stripPara = stripPara !== false

  try {
    let result = md.render(value || '').trim()

    if (stripPara) {
      result = result.replace(/^<p>|<\/p>\s*$/g, '')
    }

    return result
  } catch (e) {
    // eslint-disable-next-line no-console
    console.error('Error processing markdown:', e)
    return value
  }
}

module.exports = mdFilter
