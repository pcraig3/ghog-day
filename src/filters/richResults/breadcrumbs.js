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

  const [_, ...pathArr] = path.split('/') // eslint-disable-line no-unused-vars

  let page, entity, entityName

  if (pathArr.length >= 1) {
    page = pathArr[0]

    breadcrumbList = breadcrumbList.concat([
      {
        '@type': 'ListItem',
        position: 2,
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
        position: 3,
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
        position: 4,
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
    case 'groundhog-day-2023':
    case 'groundhogs-in-canada':
    case 'groundhogs-in-usa':
      // get last item in array and return Title case
      return _uppercase(path.split('-').pop())
    case 'history-of-groundhog-day':
    case 'add-groundhog':
      // get first item in array and return Title case
      return _uppercase(path.split('-').shift())
    case 'api':
      return 'API'
    default:
      return ''
  }
}

module.exports = richResultsBreadcrumbs
