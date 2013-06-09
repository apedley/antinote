$ ->
  $('.categoryCollapse').click(->
    categoryId = $(this).attr('id').replace(/^\D+/g, '')
    categoryDivId = "#category" + categoryId
    categoryDiv = $(categoryDivId)
    if $(this).hasClass('categoryDown')
      categoryDiv.hide()
      $(this).html('<i class="fa-icon-caret-left"></i>')
    else
      categoryDiv.show()
      $(this).html('<i class="fa-icon-caret-down"></i>')
    $(this).toggleClass('categoryDown')
    )
  collapsed = false
  $('#collapse-all').click(->
    console.log("collapsed: " + collapsed)
    if collapsed
      $('.category-list-container').show()
      $('.categoryCollapse').html('<i class="fa-icon-caret-down"></i>')
      collapsed = false
    else
      $('.category-list-container').hide()
      $('.categoryCollapse').html('<i class="fa-icon-caret-left"></i>')
      collapsed = true
    )
