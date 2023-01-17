/* global document */

document.addEventListener('DOMContentLoaded', function () {
  var input = document.querySelector('input.search')
  var results = document.querySelector('span.results')

  var countResults = function () {
    return document.querySelectorAll('.list > *').length
  }
  var setResults = function (number) {
    return `<strong>${number}</strong>&nbsp;result${number === 1 ? '' : 's'}`
  }

  if (input) {
    input.addEventListener('input', function () {
      setTimeout(function () {
        results.innerHTML = input.value ? setResults(countResults()) : ''
      }, 120)
    })
  }
})
