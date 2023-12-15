import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    function handleCheckboxClick(field) {
      var isChecked = $('#btn-check-' + field).prop('checked');
      console.log(field + ' ' + isChecked);
    
      var changedElement = $('.search-field')[0];
      if (isChecked) {
        if (changedElement.id === "query_full_name_or_email_or_age_or_tags_cont") {
          changedElement.id = "query_" + field + "_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        } else {
          changedElement.id = "query_" + changedElement.id.slice(6,changedElement.id.length - 5) + "_or_" + field + "_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        }
      } else {
        if (changedElement.id === "query_" + field + "_cont") {
          changedElement.id = "query_full_name_or_email_or_age_or_tags_cont";
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        } else {
          var fieldIndex = changedElement.id.indexOf('_or_' + field);
          changedElement.id = "query_" + changedElement.id.slice(6, fieldIndex) + changedElement.id.slice(fieldIndex + field.length + 4, changedElement.id.length);
          changedElement.name = changedElement.id.substring(0, 5) + '[' + changedElement.id.substring(6, changedElement.id.length) + ']';
        }
      }
    }
    
    $('#btn-check-name, #btn-check-email, #btn-check-age, #btn-check-tags').on('click', function() {
      handleCheckboxClick(this.id.replace('btn-check-', ''));
    });
  }
  
}