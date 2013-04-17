window.showtour =
  markers: []
  map: ''
  ready: ->
    console.log('showtour.ready...')
    showtour.initialize

  initialize: ->
    console.log('showtour.initialize...')
    showtour.show_map(13, $('#$tourmap') )


  # displays the map on the page. Takes an integer
  # for the zoom and a jquery selector pointing to the
  # map
  show_map: (lat, lng)->
    console.log('showtour.show_map...')
    canvas = $('#tourmap')[0]
    mapOptions =
      mapTypeId: google.maps.MapTypeId.ROADMAP
      zoom: 13
      center: new google.maps.LatLng(lat, lng)

    showtour.map = new google.maps.Map(canvas, mapOptions)

  # adds a marker to the map
  add_marker: (lat, lng, title)->
    console.log('showtour.add_marker...')
    coords = new google.maps.LatLng(lat, lng)
    marker = new google.maps.Marker(
      position: coords
      map     : showtour.map
      title   : title
    )
    marker.setMap(showtour.map)
    showtour.markers.push(marker)







$(document).ready(showtour.ready)

