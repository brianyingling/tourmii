window.tour =
  ready: ->
    console.log('tour.ready')
    $('body').on('click','#save_tour_btn',tour.save)
    $('body').on('click', '.step_edit_btn', tour.edit_step)
    $('body').on('load', '#tourmap', tour.show_tourmap)


  show_tourmap: ->
    console.log('showing tour map...')

  edit_step: (e) ->
    # e.preventDefault
    console.log('editing step...')
    td = $(this).parent().parent().find('td')
    position = $(td).first().text()
    _.each td, (r) ->
      console.log(r)
      if r != $(td).last()
        value = $(r).text()
        $(r).empty().append("<input type='text' value='#{value}'/>")
    return false


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
      dataType: 'script'
      type: 'post'
      url: '/tours/'
      data: {tour: tour}
      authenticity_token: authenticity_token
      ).done()


$(document).ready(tour.ready)
