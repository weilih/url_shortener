$(function(){
  $('#pop').on('show.bs.modal', function (event) {
    var target = $(event.relatedTarget) // Button that triggered the modal
    var shorten = target.data('goto') // Extract info from data-* attributes
    var original = target.data('long')
    var modal = $(this)

    modal.find('.modal-title').text(shorten)
    modal.find('.modal-body a').attr("href", original).text(original)
    modal.find('.modal-body iframe').attr('src', original)
    modal.find('.modal-footer a').attr("href", shorten)
  })

  $('#new_page').on('click', this, function(event){
   shorten = $(this).attr('href').substring(1)
   visited = $("td a[href*="+shorten+"]").parent().siblings('.v_counter')
   $(visited).text( parseInt(visited.text()) + 1 )
   $('#pop').modal('hide')
  })

  // $('.link_to_blank').on('click', this, function(event){
  //   visited = $(this).parent().siblings('.v_counter')
  //   $(visited).text( parseInt(visited.text()) + 1)
  //   $('#pop').modal({ backdrop: 'static', keyboard: true })
  // })

  $('.no-popup').on('click', this, function(event){
    $('#pop').modal({ backdrop: 'static', keyboard: true })
  })

});
