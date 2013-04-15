window.tour =
  ready: ->
    $('body').on('click','#save_tour_btn',tour.save)

  save:(e) ->
    # ajax call
    e.preventDefault()
    console.log('saving tour...')
    tour = []
    i = 0
    while i < $('#tour_form_container').children.length
      # get the basic data from each step
      data = $( $('#tour_form_container').children()[i] )
      data = $(data[0])
      name = $(data.children()[0]).text()
      address = $(data.children()[1]).text()
      step =
        name: name
        address: address
      tour.push(step)
      i++



$(document).ready(tour.ready)
