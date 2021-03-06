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
    if $(this).html() == 'Reviews | '
      showtour.show_modal_content(reference, 'reviews')
    else
      showtour.show_modal_content(reference, 'photos')
    $('#reviews_modal').foundation('reveal','open')
    return false

  close_modal: (e) ->
    console.log('showtour.close_modal...')
    e.preventDefault
    $('#reviews_modal').foundation('reveal','close')

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

  show_modal_content: (ref, contentType)->
    console.log('show tour reviews...')
    window.service = new google.maps.places.PlacesService(showtour.map)
    refObj =
      reference: ref
    window.service.getDetails refObj, (place, status) ->
      if status == google.maps.places.PlacesServiceStatus.OK
        console.log('service status Ok...')
        if contentType == 'reviews'
          console.log(place)
          div = "<div class='place'>"
          div += "<div class='place_name'>#{place.name}</div>"
          div += "<div class='place_address'>#{place.formatted_address}</div>"
          div += "<div class='place_phone_number'>#{place.formatted_phone_number}</div>"
          _.each place.types, (tag) ->
            div += "<span class='place_tags'>#{tag}</span> "

          _.each place.reviews, (r) ->
           div += "<div class='place_review'>#{r.text}</div>"
           div += "<div class='author_name'>Posted by "
           if r.author_url != undefined
            div += "<a href='#{r.author_url}'>#{r.author_name}</a>"
           else
            div += "<a href='#'>#{r.author_name}</a>"
           div += " on #{Date(r.time)}</div>"
          $('#reviews_modal').empty().prepend(div)
          $('#reviews_modal').append("<a class='close-reveal-modal'>x</a>")
        else
          $('#reviews_modal').css('min-width','500px').css('min-height','550px');
          if _.isEmpty place.photos
            div += "<li>There are no available photos to show.</li>"
          else
            div = "<div class='orbit-container'>"
            div += "<ul data-orbit=\"\" class='orbit-slides-container'>"
            _.each place.photos, (p) ->
                div += "<li>"
                div += "<img class='photo' src='#{p.getUrl({maxHeight:1000, maxWidth:1000})}' />"
                div += "</li>"
            div += "</ul></div>"
          # div += "<script>$(document).foundation()</script>"
          $('#reviews_modal').empty().prepend(div)
          $('#reviews_modal').append("<a class='close-reveal-modal'>x</a>")
          $(document).foundation()
      else
        console.log(status)







$(document).ready(showtour.ready)

