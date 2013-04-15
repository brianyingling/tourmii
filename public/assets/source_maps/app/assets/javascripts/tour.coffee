window.tour =
  ready: ->
    $('body').on('click','#save_tour_btn',tour.save)

  # makes an ajax call to the server to save all of the
  # steps as a tour object
  save:(e) ->
    e.preventDefault()
    console.log('saving tour...')
    authenticity_token = $("input[name='authenticity_token']").val()
    tour = []
    i = 0
    tour_data =
      name: $('#tourdata_name').val()
      description: $('#tourdata_description').val()

    tour.push(tour_data)
    while i < $('#tour_form_container').children().length
      # get the basic data from each step
      data = $( $('#tour_form_container').children()[i] )
      data = $(data)[0]
      name = $(data.children[0]).text()
      address = $(data.children[1]).text()
      step =
        number: i+1
        name: name
        address: address
      tour.push(step)
      i++

    $.ajax(
      dataType: 'json'
      type: 'post'
      url: '/tours/'
      data: {tour: tour}
      authenticity_token: authenticity_token
      ).done()


$(document).ready(tour.ready)
