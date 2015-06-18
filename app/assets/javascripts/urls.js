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
});
