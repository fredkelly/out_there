$ ->
  $carousel = $('#carousel')
  $ideas = $('.idea', $carousel)

  showNext = ->
    active = $ideas.filter('.active')
    nextActive = active.next('.idea')
    if nextActive.length
      # we have more ideas
      nextActive.addClass('active')
    else
      # we've run out
      $('.no-more', $carousel).show()
    # clear reviewed idea
    active.removeClass('active')

  $('.vote > button').on('click', (e) ->
    id = $(@).parents('.idea').data('id')
    $.post("/ideas/#{id}/vote.json", vote: $(@).attr('class'), (idea, status, xhr) ->
      showNext() if xhr.status == 201
    )
  )

  # show new idea form
  # TODO move this somewhere else?
  $('form#new_idea').on('focus keypress', 'input, textarea', (e) ->
    console.log e
    form = $(e.target.parentNode)

    if e.type == 'focusin'
      $('.hide', form).show()
      true

    # submit form?
    else if e.type == 'keypress' && e.which == 13
      form.submit()
      false
  )
