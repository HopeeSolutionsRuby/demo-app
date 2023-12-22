import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

    // $(document).ready(function(){
    //   var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
    //     removeItemButton: true,
    //     maxItemCount:3,
    //     searchResultLimit:3,
    //   }); 
    // });

    var options = [];
    $('.dropdown-menu a').on( 'click', function( event ) {
      var $target = $( event.currentTarget ),
          val = $target.attr( 'data-value' ),
          $inp = $target.find( 'input' ),
          idx;
      if ( ( idx = options.indexOf( val ) ) > -1 ) {
          options.splice( idx, 1 );
          setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
      } else {
          options.push( val );
          setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
      }
      $( event.target ).blur();   
      console.log( options );
      return false;
    });

    window.closeBadge = (button, faculty) => {
      var badge = button.closest('.badge');
      if (badge) {
        badge.remove();
  
        // Uncheck the corresponding checkbox in the modal
        var checkbox = document.querySelector('input[name="query[faculity_in][]"][value="' + faculty + '"]');
        if (checkbox) {
          checkbox.checked = false;
        }
        var anyCheckboxChecked = document.querySelector('input[name="query[faculity_in][]"]:checked');
        var anyCheckboxRegionChecked = document.querySelector('input[name="query[region_in][]"]:checked');
      
        // Reset the form only if no checkboxes are checked
        if (anyCheckboxChecked == null && anyCheckboxRegionChecked == null) {
          var form = document.getElementById('search-form');
          form.reset();
          form.submit();
        } else {
          document.getElementById('submit-button').click();
        }
        
      }
    }
  
    window.closeRegionBadge = (button, region) => {
      var badge = button.closest('.badge');
      if (badge) {
        badge.remove();
  
        // Uncheck the corresponding checkbox in the modal
        var checkbox = document.querySelector('input[name="query[region_in][]"][value="' + region + '"]');
        if (checkbox) {
          checkbox.checked = false;
        }
        var anyCheckboxRegionChecked = document.querySelector('input[name="query[region_in][]"]:checked');
        var anyCheckboxChecked = document.querySelector('input[name="query[faculity_in][]"]:checked');
        // Reset the form only if no checkboxes are checked
        console.log(anyCheckboxChecked == null && anyCheckboxRegionChecked == null);
        if (anyCheckboxChecked == null) {
          var form = document.getElementById('search-form');
          form.reset();
          form.submit();
        } else {
          document.getElementById('submit-button').click();
        }
        
      }
    }

    // document.getElementById('submit-button').addEventListener('click', function() {
    //   console.log("submit-button")
    //   $('#filterClinicModal').modal('hide');
    // });
    

  }
}
