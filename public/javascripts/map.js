/* global document, L */

const cards = document.querySelector('#sortable--map')

function unselectCards() {
  cards.querySelectorAll('.card').forEach((e) => e.classList.remove('selected'))
}

function selectCard(id) {
  const card = cards.querySelector(`.card[data-id="${id}"]`)

  // if already selected, skip
  if (!card.classList.contains('selected')) {
    unselectCards()
    card.classList.add('selected')
  }
}

// https://jsfiddle.net/sxvLykkt/12/
var gh = JSON.parse(document.getElementById('data').textContent)

var map = L.map('map').setView([43.71, -94.7], 4)

L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/toner-lite/{z}/{x}/{y}{r}.{ext}', {
  attribution:
    'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
  subdomains: 'abcd',
  minZoom: 2,
  maxZoom: 10,
  ext: 'png',
  detectRetina: true,
  crossOrigin: 'anonymous',
}).addTo(map)

var mapIcon =
  '<svg height="100%" stroke-miterlimit="10" style="fill-rule:nonzero;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;" version="1.1" viewBox="0 0 428.379 700" width="100%" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:vectornator="http://vectornator.io" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="pin"><path fill="{mapIconColor}" d="M214.143 385.529C119.668 385.529 43.0775 308.94 43.0775 214.463C43.0775 119.987 119.671 43.398 214.143 43.398C308.623 43.398 385.208 119.987 385.208 214.463C385.213 308.943 308.619 385.529 214.143 385.529ZM0.179755 214.463C0.179755 284.928 28.5413 358.336 214.143 699.916C402.014 351.516 428.106 284.929 428.106 214.463C428.106 96.2944 332.31 0.500337 214.143 0.500337C95.9738 0.500337 0.179755 96.2906 0.179755 214.463Z" fill-rule="evenodd" opacity="1" stroke="none"/><path fill="{mapIconColorInnerCircle}" d="M42.9261 214.123C42.9261 119.673 119.493 43.1056 213.944 43.1056C308.394 43.1056 384.962 119.673 384.962 214.123C384.962 308.574 308.394 385.141 213.944 385.141C119.493 385.141 42.9261 308.574 42.9261 214.123Z" fill-rule="nonzero" opacity="1" stroke="none"/></g></svg>'
var mapIconSelected =
  '<svg height="100%" stroke-miterlimit="10" style="fill-rule:nonzero;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;" version="1.1" viewBox="0 0 428.379 700" width="100%" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:vectornator="http://vectornator.io" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="pin-2"><g><path fill="{mapIconColor}" d="M214.143 385.529C119.668 385.529 43.0775 308.94 43.0775 214.463C43.0775 119.987 119.671 43.398 214.143 43.398C308.623 43.398 385.208 119.987 385.208 214.463C385.213 308.943 308.619 385.529 214.143 385.529ZM0.179755 214.463C0.179755 284.928 28.5413 358.336 214.143 699.916C402.014 351.516 428.106 284.929 428.106 214.463C428.106 96.2944 332.31 0.500337 214.143 0.500337C95.9738 0.500337 0.179755 96.2906 0.179755 214.463Z" fill-rule="evenodd" opacity="1" stroke="none"/></g><path fill="{mapIconColorInnerCircle}" d="M42.9261 214.123C42.9261 119.673 119.493 43.1056 213.944 43.1056C308.394 43.1056 384.962 119.673 384.962 214.123C384.962 308.574 308.394 385.141 213.944 385.141C119.493 385.141 42.9261 308.574 42.9261 214.123Z" fill-rule="nonzero" opacity="1" stroke="none"/><g><path fill="{mapIconColor}" d="M281.932 226.871C276.522 226.871 272.139 231.147 272.139 236.424C272.139 249.373 261.337 259.91 248.062 259.91C234.788 259.91 223.981 249.373 223.981 236.424C223.981 235.774 223.912 235.142 223.781 234.522L230.509 234.522C235.919 234.522 240.306 230.246 240.306 224.969C240.306 219.691 235.917 215.415 230.509 215.415L197.862 215.415C192.452 215.415 188.069 219.691 188.069 224.969C188.069 230.246 192.452 234.522 197.862 234.522L204.588 234.522C204.459 235.136 204.391 235.774 204.391 236.424C204.391 249.373 193.589 259.91 180.314 259.91C167.04 259.91 156.238 249.373 156.238 236.424C156.238 231.147 151.854 226.871 146.444 226.871C141.034 226.871 136.651 231.147 136.651 236.424C136.651 251.952 145.24 265.527 158.002 272.971L158.002 310.163C158.002 315.44 162.386 319.716 167.796 319.716L214.187 319.716L260.576 319.719C265.986 319.719 270.369 315.443 270.369 310.165L270.369 272.971C283.132 265.525 291.723 251.949 291.723 236.422C291.726 231.147 287.342 226.871 281.932 226.871L281.932 226.871ZM177.585 278.886C178.493 278.94 179.391 279.02 180.312 279.02C189.208 279.02 197.482 276.398 204.388 271.924L204.388 300.608L177.584 300.608L177.585 278.886ZM250.779 300.608L223.975 300.608L223.975 271.924C230.883 276.395 239.155 279.019 248.056 279.019C248.972 279.019 249.875 278.94 250.778 278.886L250.779 300.608Z" fill-rule="nonzero" opacity="1" stroke="none"/><path fill="{mapIconColor}" d="M124 199.242C124 208.695 116.143 216.359 106.452 216.359C96.7603 216.359 88.904 208.695 88.904 199.242C88.904 189.788 96.7603 182.125 106.452 182.125C116.143 182.125 124 189.788 124 199.242"  fill-rule="nonzero" opacity="1" stroke="none"/><path fill="{mapIconColor}" d="M339.475 199.242C339.475 208.695 331.619 216.359 321.928 216.359C312.236 216.359 304.38 208.695 304.38 199.242C304.38 189.788 312.236 182.125 321.928 182.125C331.619 182.125 339.475 189.788 339.475 199.242" fill-rule="nonzero" opacity="1" stroke="none"/></g></g></svg>'

var markerArray = []
var iMarker = -1

var divIcon = L.divIcon({
  className: 'leaflet-data-marker',
  html: L.Util.template(mapIcon, {
    mapIconColor: '#777777',
    mapIconColorInnerCircle: '#ffffff',
  }),
  iconAnchor: [17, 42],
  iconSize: [35, 40],
  popupAnchor: [0, -35],
})

var divIconActive = L.divIcon({
  className: 'leaflet-data-marker',
  html: L.Util.template(mapIconSelected, {
    mapIconColor: '#000000',
    mapIconColorInnerCircle: '#ffffff',
  }),
  iconAnchor: [19, 49],
  iconSize: [40, 47],
  popupAnchor: [0, -45],
})

function setActiveIcon(marker) {
  marker.setIcon(divIconActive)
}

var markers = L.markerClusterGroup({ maxClusterRadius: 27, disableClusteringAtZoom: 6 })

/* create marker for each groundhog */
gh.map((g) => {
  let [lat, long] = g.coordinates.split(',')
  let marker = L.marker([lat, long], { icon: divIcon, id: g.id })

  const icon = !g.latestPrediction ? '' : g.latestPrediction === 'winter' ? '❄️' : '🌼'
  const popupOptions = {
    className: `leaflet-popup--${!g.latestPrediction ? 'none' : g.latestPrediction}`,
    closeButton: false,
  }

  marker.bindPopup(
    `<span class="leaflet-popup--triangle"></span>
        <strong class="groundhog-name"><a href="https://groundhog-day.com/groundhogs/${g.slug}">${g.name}</a></strong> ${icon}
        <br />
        ${g.type}
        <br />
        ${g.city}, ${g.region}`,
    popupOptions,
  )

  const tooltipOptions = {
    direction: 'top',
    offset: [-10, -50],
    sticky: true,
    opacity: 1,
  }

  marker.bindTooltip(g.name, tooltipOptions).openTooltip()

  marker.on('mouseover', function () {
    if (iMarker === this.options.id) return
    setTimeout(setActiveIcon, 5, this)

    if (iMarker >= 0 && !markerArray[iMarker].isPopupOpen()) {
      // marker exists does not have an open popup
      markerArray[iMarker].setIcon(divIcon)
    }
    iMarker = this.options.id
  })

  marker.on('popupopen', function () {
    selectCard(this.options.id)
  })

  marker.on('mouseout popupclose', function (e) {
    if (e.type !== 'popupclose' && this.isPopupOpen()) return

    unselectCards()
    this.setIcon(divIcon)
    iMarker = -1
  })

  marker.on('tooltipopen', function () {
    // close all tooltips
    markerArray.map((m) => {
      if (m.options.id !== this.options.id) {
        m.closeTooltip()
      }
    })

    // if popup open on this marker, close tooltip
    if (this.isPopupOpen()) {
      this.closeTooltip()
    }
  })

  markerArray[g.id] = marker

  markers.addLayer(marker)
})

map.addLayer(markers)

function clickItem() {
  const id = this.dataset.id

  if (iMarker >= 0) {
    markerArray[iMarker].setIcon(divIcon)
  }

  selectCard(id)
  markerArray[id].setIcon(divIconActive)
  markerArray[id].openPopup()

  map.flyTo(markerArray[id]._latlng, 6).once('moveend', () => {
    markerArray[id].openPopup()
  })

  iMarker = id
}

var items = document.getElementById('sortable--map').querySelectorAll('.card')
Array.prototype.forEach.call(items, (item) => {
  item.addEventListener('click', clickItem, false)
})
