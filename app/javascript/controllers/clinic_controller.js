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
        } else {
          changedElement.id = "query_" + changedElement.id.split('_')[1] + "_or_" + field + "_cont";
        }
      } else {
        if (changedElement.id === "query_" + field + "_cont") {
          changedElement.id = "query_name_or_address_or_faculity_or_region_cont";
        } else {
          var fieldIndex = changedElement.id.indexOf('_or_' + field + '_cont');
          changedElement.id = "query_" + changedElement.id.slice(6, fieldIndex) + changedElement.id.slice(fieldIndex + field.length + 4, fieldIndex + field.length + 9 );
        }
      }
    }
    
    $('#btn-check-name, #btn-check-address, #btn-check-region, #btn-check-faculity').on('click', function() {
      handleCheckboxClick(this.id.replace('btn-check-', ''));
    });
  }
  
}