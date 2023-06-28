$(document).off('click', '.page-link-ajax').on('click', '.page-link-ajax', function(e) {
  e.preventDefault();
  
  var $this = $(this);
  
  // if an AJAX request is running
  if ($this.data('ajax-in-progress')) {
    return; // Ignore the click event if a request is already running
  }
  
  $this.data('ajax-in-progress', true); // Set the flag to indicate an AJAX request is starting

  var url = $this.attr('href');
  console.log(url);

  $.ajax({
    url: url,
    type: 'GET',
    dataType: 'script'
  })
    .done(function(response) {
      $this.data('ajax-in-progress', false);
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      $this.data('ajax-in-progress', false);
    });
});
