window.markers = []
window.map = ''
window.infowindow = ''
window.places = []
window.detailedResponses = {}
window.service = ''
window.reference_count = 0
window.slider = ''

window.search =
  lat: 0
  lng: 0
  key: 'AIzaSyCvzuNHRQq5SRJZnyqPJ6c5nMzyeDm2kU0'
  reference_count: 0
  url: ''
  map: ''
  ready: ->
    console.log('ready')
    $('body').on('click','#search_nav_btn', search.get_location)
    $('body').on('click', '#createtour_nav_btn', search.get_location)
    $('body').on('click', '#createtour_search_btn', search.display_map)
    $('body').on('click', '.infowindow', search.click_content)
    $('body').on('click', '#reviews_link', search.show_reviews)
    $('body').on('click', '#photos_link', search.show_photos)
    $('body').on('click', '.cancel_btn', search.show_photos)

  show_reviews:(e) ->
    e.preventDefault
    $('.review').toggle()
    return false

  show_photos: (e) ->
    e.preventDefault
    if $('#photo_list').css('display') == 'none'
      $('#photo_list').css('display','inline-block')
    else
      $('#photo_list').css('display','none')
    return false

  click_content: ->
    console.log('clicking content...')
    content = $(this).clone()
    $('#tour_form_container').append(content)

  display_map: ->
    $('#map').show();
    $('#create_tour_form').show()
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
      query: $('#search').val().split(' ').join('+')
    window.service = new google.maps.places.PlacesService(map)
    window.service.textSearch(request, search.callback)
    return false

  callback: (results, status) ->
    console.log('callback')
    if status == google.maps.places.PlacesServiceStatus.OK
      i = 0
      while i < results.length
        places.push(results[i])
        # place = results[i]
        search.createMarker(results[i])
        i++

  # sets the boundaries of the map to include
  # all selected
  set_bounds: ->
    console.log('setting bounds...')
    bounds = new google.maps.LatLngBounds();
    i = 0
    while i < window.markers.length
      latlng = new google.maps.LatLng(window.markers[i].position.lat(),window.markers[i].position.lng() )
      bounds.extend(latlng)
      i++
    window.map.fitBounds(bounds)
    window.map.setCenter(bounds.getCenter() )

  get_place_details: (result) ->
    console.log('get place details...')
    query = "https://maps.googleapis.com/maps/api/place/details"
    query += '/json'
    query += '?reference='+result.reference
    query += '&sensor=true'
    query += "&key=#{search.key}"
    jsonObj = {}



    # make ajax call
    $.ajax(
      dataType: 'json'
      type: 'get'
      url: query
      ).done( (data)->
        console.log(data.results.length)
        jsonObj = data
      )
    return jsonObj

  set_infowindow: (result, marker)->
    console.log('setting infowindow')
    window.infowindow = new google.maps.InfoWindow(
      content: "#{result.name} #{result.formatted_address}"
    )
    content = search.build_infowindow_div(result)
    google.maps.event.addListener marker, 'click', ->
      console.log('setting event...')
      # search.get_place_details(result)
      refObj =
        reference: result.reference
      window.service.getDetails refObj, (place, status) ->
        if status == google.maps.places.PlacesServiceStatus.OK
          console.log(place)
          console.log(place.name)
          console.log(place.formatted_address)
          $('#details').empty().append(search.build_details_div(place) )
        else
          console.log(status)

      window.infowindow.setContent(content)
      window.infowindow.open(window.map, marker)
    # $('#reviews_modal').reveal()

  build_infowindow_div: (result)->
    div   =  "<div id='#{result.name}' class='infowindow'>"
    div   += "<div id='place_name'>#{result.name}</div>"
    div   += "<div id='place_address'>#{result.formatted_address}</div>"
    div   += "<input type='hidden' id='reference_#{search.reference_count}' class='place_reference' value='#{result.reference}'"
    div   += "</div>"
    search.reference_count += 1
    return div

  build_details_div: (place) ->
    div =   "<div id='place_name'>#{place.name}</div>"
    div +=  "<div id='place_address'>#{place.formatted_address}</div>"
    div +=  "<div id='place_price_level'>Price Level: #{place.price_level}</div>"
    div +=  "<div id='place_rating'>Rating: #{place.rating}</div>"

    div += "<div id='reviews'><a href='' id='reviews_link'>Click for Reviews</a><br/>"
    _.each place.reviews, (review) ->
      div += "<div class='review'>"
      div += "<div class='review_text'>#{review.text}</div>"
      div += "<div class='review_author'>Reviewed by <a href='#{review.author_url}'>#{review.author_name}</a></div>"
      div += "<div class='review_time'>Posted on #{Date(review.time)}</div>"
      div += "</div></div>"

    div += "<div id='photos' class='photos'><a href='' id='photos_link'>Click for Photos</a><br/>"
    # div += "<div id='photo_list'><a href='' class='cancel_btn'>x</a>"
    window.slider = new Slider('#photo_list')
    photos = []
    _.each place.photos, (photo) ->
      photos.push({'src':photo.getUrl({maxWidth:500,maxHeight:500})})
      # div += "<div class='photo'><img src='#{photo.getUrl({maxWidth:200,maxHeight:200})}'/></div>"
    div += "</div></div>"
    window.slider.setPhotos(photos)
    window.slider.setSize(500,500)
    div += "</div>"
    return div


  createMarker: (result)->
    console.log('create marker')
    marker = new google.maps.Marker(
      position: result.geometry.location
      title: result.name
    )
    marker.setMap(map)
    markers.push(marker)
    search.set_bounds()
    search.set_infowindow(result, marker)




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
