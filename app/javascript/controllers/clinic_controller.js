import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    function handleCheckboxClick(field) {
      var isChecked = $('#btn-check-' + field).prop('checked');
      console.log(field + ' ' + isChecked);
    
      var changedElement = $('.search-field')[0];
      if (isChecked) {
        if (changedElement.id === "query_name_or_address_or_faculity_or_region_cont") {
          changedElement.id = "query_" + field + "_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        } else {
          changedElement.id = changedElement.id.substring(0,changedElement.id.length - 5) + "_or_" + field + "_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        }
      } else {
        if (changedElement.id === "query_" + field + "_cont") {
          changedElement.id = "query_name_or_address_or_faculity_or_region_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        } else {
          var fieldIndex = changedElement.id.indexOf('_or_' + field);
          changedElement.id = changedElement.id.substring(0, fieldIndex) + changedElement.id.substring(fieldIndex + field.length + 4, changedElement.id.length);
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        }
      }
    }
    
    $('#btn-check-name, #btn-check-address, #btn-check-region, #btn-check-faculity').on('click', function() {
      handleCheckboxClick(this.id.replace('btn-check-', ''));
    });

    $(document).ready(function(){
    
      var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
        removeItemButton: true,
        maxItemCount:3,
        searchResultLimit:3,
      }); 
      
      
  });
  }
  
}
