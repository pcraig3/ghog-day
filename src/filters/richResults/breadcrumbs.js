const richResultsBreadcrumbs = (path) => {
  let breadcrumbList = [
    {
      '@type': 'ListItem',
      position: 1,
      name: 'Home',
      item: 'https://groundhog-day.com/',
    },
  ]

  if (path === '/') return JSON.stringify(_returnBreadcrumbs(breadcrumbList), null, 2)

  if (['/alternative-groundhogs', '/groundhogs-in-canada', '/groundhogs-in-usa'].includes(path)) {
    // the "groundhogs" route is the parent of these pages
    breadcrumbList = breadcrumbList.concat([
      {
        '@type': 'ListItem',
        position: breadcrumbList.length + 1,
        name: 'Groundhogs',
        item: 'https://groundhog-day.com/groundhogs',
      },
    ])
  }

  const [_, ...pathArr] = path.replace(/\/$/, '').split('/') // eslint-disable-line no-unused-vars

  let page, entity, entityName

  if (pathArr.length >= 1) {
    page = pathArr[0]

    breadcrumbList = breadcrumbList.concat([
      {
        '@type': 'ListItem',
        position: breadcrumbList.length + 1,
        name: _getName(page),
        item: `https://groundhog-day.com/${page}`,
      },
    ])
  }

  // either a groundhog or a prediction
  if (pathArr.length >= 2) {
    entity = pathArr[1]
    entityName = entity
      .split('-')
      .map((word) => (['la', 'the', 'and'].includes(word) ? word : _uppercase(word)))
      .join(' ')

    breadcrumbList = breadcrumbList.concat([
      {
        '@type': 'ListItem',
        position: breadcrumbList.length + 1,
        name: entityName,
        item: `https://groundhog-day.com/${page}/${entity}`,
      },
    ])
  }

  // the prediction page for a groundhog
  if (pathArr.length === 3) {
    /* eslint-disable indent */
    const shortName =
      entityName === 'Ms G'
        ? 'Ms. G'
        : ['la', 'the', 'and', 'Stormy', 'Stonewall'].some((phrase) => entityName.includes(phrase))
        ? entityName.split(' ').shift()
        : entityName.split(' ').pop()
    /* eslint-enable */

    breadcrumbList = breadcrumbList.concat([
      {
        '@type': 'ListItem',
        position: breadcrumbList.length + 1,
        name: `${shortName}’s predictions`,
        item: `https://groundhog-day.com/${page}/${entity}/predictions`,
      },
    ])
  }

  return JSON.stringify(_returnBreadcrumbs(breadcrumbList), null, 2)
}

const _returnBreadcrumbs = (items) => {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items,
  }
}

const _uppercase = (str) => str.charAt(0).toUpperCase() + str.substring(1).toLowerCase()

const _getName = (path) => {
  switch (path) {
    case 'groundhogs':
    case 'predictions':
    case 'about':
    case 'contact':
    case 'groundhog-day-2024':
      // get last item in array and return Title case
      return path
        .split('-')
        .map((word) => _uppercase(word))
        .join(' ')
    case 'history-of-groundhog-day':
    case 'add-groundhog':
      // get first item in array and return Title case
      return _uppercase(path.split('-').shift())
    case 'api':
      return 'API'
    case 'map':
      return 'Groundhog Map'
    case 'groundhogs-in-canada':
      return 'Groundhogs in Canada'
    case 'groundhogs-in-usa':
      return 'Groundhogs in USA'
    case 'alternative-groundhogs':
      return 'Alternative groundhogs'
    default:
      return ''
  }
}

module.exports = richResultsBreadcrumbs
