import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    $('#btn-check-name').on('click', function() {
      var isChecked = $(this).prop('checked');
      console.log(isChecked)
      var changedElement = document.getElementsByClassName('search-field')[0]
      if (isChecked) {
        if (changedElement.id === "query_name_or_address_or_faculity_or_region_cont") {
          changedElement.id = "query_" + field + "_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        } else {
          changedElement.id = "query_" + changedElement.id.slice(6,changedElement.id.length - 5) + "_or_" + field + "_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        }
      } else {
        if (changedElement.id === "query_" + field + "_cont") {
          changedElement.id = "query_name_or_address_or_faculity_or_region_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        } else {
          var fieldIndex = changedElement.id.indexOf('_or_' + field);
          changedElement.id = "query_" + changedElement.id.slice(6, fieldIndex) + changedElement.id.slice(fieldIndex + field.length + 4, changedElement.id.length);
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        }
      }
    });
  }
  
}
