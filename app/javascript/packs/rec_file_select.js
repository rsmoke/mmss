
function hidesubmit(){
  if ($("#recupload_recletter").val() == "" && $("#recupload_letter").val() == "" ) {
    $(':submit').hide();
  } else {
    $(':submit').show();
  }
}

  $(function(){
    hidesubmit();
    // Hide submit button if either field is empty
    $('form input').keyup(function() {
      hidesubmit();
    });

    $('input[type="file"]').change(function() {
      hidesubmit();
    });
  });