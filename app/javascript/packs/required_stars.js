$(function () {
  $("input[required]").each(function(index) {
    var id = $(this).attr('id');
    $('label[for="'+id+'"]').append('*');
  })
})
