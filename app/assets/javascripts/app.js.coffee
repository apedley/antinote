$ ->

  updatePreview = ->
    rawText = $('#note_body').val()

    $.get '/home/preview.json',
      text: rawText
      (data) ->
        console.log data
        $('#markdown-preview').html(data)

  timer = 0
  
  $('#note_body').on('keyup', (e) ->
    if timer
      clearTimeout(timer)
    timer = setTimeout(updatePreview, 800)
  )

  # TODO: Rewrite this
  $('#main-menu-toggle').click(->
    span = $('#content').attr('class')
    content = $('#content')  
    spanNum = parseInt(span.replace(/^\D+/g, ''))
    if $(this).hasClass 'open'
      $(this).removeClass('open').addClass('close')
      newSpanNum = spanNum + 1;
      newSpan = 'span' + newSpanNum;
      content.removeClass('span'+spanNum)
      content.addClass(newSpan)
      content.addClass('full-radius')
      $('#sidebar-left').hide();
    else
      $(this).removeClass('close').addClass('open')
      content.removeClass('full-radius')
      newSpanNum = spanNum - 1;
      newSpan = 'span' + newSpanNum;
      content.removeClass('span'+spanNum)
      content.addClass(newSpan)
      $('#sidebar-left').show();
    )