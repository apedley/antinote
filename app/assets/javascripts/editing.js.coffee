$ ->
  $('#preview-btn').click(->
    rawText = $('#note_body').text()
    $.get '/home/preview.json',
      text: rawText
      (data) ->
        console.log data
        $('#markdown-preview').html(data)
    )