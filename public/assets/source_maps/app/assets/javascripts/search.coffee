window.markers = []
window.map = ''

window.search =
  lat: 0
  lng: 0
  key: 'AIzaSyCvzuNHRQq5SRJZnyqPJ6c5nMzyeDm2kU0'
  url: ''
  map: ''
  ready: ->
    console.log('ready')
    $('body').on('click','#search_nav_btn', search.get_location)
    $('body').on('click', '#search_btn', search.display_map)

  display_map: ->
    $('#map').show();
    canvas = $('#map')[0]
    latlng = new google.maps.LatLng(search.lat,search.lng)
    bounds = new google.maps.LatLngBounds()
    mapOptions =
      center: latlng
      zoom: 13
      mapTypeId: google.maps.MapTypeId.ROADMAP
    window.map = new google.maps.Map(canvas, mapOptions)
    request =
      location: latlng
      radius: 5000
      query: 'pizza'
    debugger
    service = new google.maps.places.PlacesService(map)
    service.textSearch(request, search.callback)

  callback: (results, status) ->
    console.log('callback')
    if status == google.maps.places.PlacesServiceStatus.OK
      i = 0
      while i < results.length
        place = results[i]
        search.createMarker results[i]
        i++

  createMarker: (result)->
    console.log('create marker')
    marker = new google.maps.Marker ->
      position: result.geometry.location
      map: map
      title: result.name
      icon: 'http://www.yohman.com/students/yoh/week4/images/school.png'
    marker.setMap(map)
    markers.push(marker)

  build_query_string: (keyword) ->
    url = "https://maps.googleapis.com/maps/api/place/textsearch"
    url += "/json"
    url += "?location=#{search.lat},#{search.lng}"
    url += "&radius=5000"
    url += "&query=#{keyword}"
    url += "&sensor=true"
    url += "&key=#{search.key}"

  # queries Google Places and receives a JSON object
  test_query: ->
    nearby_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+search.lat+","+search.lng+"&radius=5000&types=food&name=pizza&sensor=true&key="+search.key
    text_search = "https://maps.googleapis.com/maps/api/place/textsearch/json?location="+@lat+","+@lng+"&radius=5000&query=pizza&sensor=true&key="+@key


  # retrieves the user's current position
  get_location: ->
    console.log('getting location...')
    navigator.geolocation.getCurrentPosition(search.get_coords)

  get_coords: (position)->
    console.log('coords')
    search.lat = position.coords.latitude
    search.lng = position.coords.longitude
    console.log("lat: #{search.lat}, lng: #{search.lng}")

  handle_coords_error: (error) ->
    console.log("im handling the error")
    switch error.code
      when error.PERMISSION_DENIED then alert('Permission denied error')
      when error.POSITION_UNAVAILABLE then alert('Could not detect current position')
      when error.TIMEOUT then alert('Timeout occurred')
      else alert('Error unknown')









$(document).ready(search.ready)
