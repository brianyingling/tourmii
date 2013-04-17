window.showtour =
  markers: []
  map: ''
  ready: ->
    console.log('showtour.ready...')
    $('body').on('click','.photos_link',showtour.open_modal)
    $('body').on('click','.close-reveal-modal',showtour.close_modal)
    showtour.initialize()


  initialize: ->
    console.log('showtour.initialize...')
    # showtour.show_map(13, $('#tourmap') )
    map = $('#tourmap')[0]

  open_modal: (e)->
    console.log('showtour.show_modal...')
    e.preventDefault
    reference = $(this).parent().find('#reference').val()
    # define function to capture reviews
    showtour.show_tour_reviews(reference)
    $('#reviews_modal').foundation('reveal','open')
    showtour.show_tour_reviews()
    return false

  close_modal: (e) ->
    console.log('showtour.close_modal...')
    e.preventDefault
    $('#reviews_modal').foundation('reveal','close')

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

  show_tour_reviews: (ref)->
    console.log('show tour reviews...')
    window.service = new google.maps.places.PlacesService(showtour.map)
    refObj =
      reference: ref
    window.service.getDetails refObj, (place, status) ->
      if status == google.maps.places.PlacesServiceStatus.OK
        console.log('service status Ok...')
        console.log(place)
        div = ''
        _.each place.reviews, (p) ->
         div += "<div>#{p.text}</div>"
        $('#reviews_modal').prepend(div)
      else
        console.log(status)






$(document).ready(showtour.ready)

