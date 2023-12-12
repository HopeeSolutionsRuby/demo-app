import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    $('#btn-check-name').on('click', function() {
      var isChecked = $(this).prop('checked');
      console.log(isChecked)
      var changedElement = document.getElementsByClassName('search-field')[0]
      if (isChecked) {
        changedElement.id = "query_name_cont"
        changedElement.name = "query[name_cont]"
      }
      else {
        document.getElementsByClassName('search-field').id = "query_name_or_address_or_faculity_or_region_cont"
        changedElement.name = "query[name_or_address_or_faculity_or_region_cont]"
      }
    });

    $('#btn-check-address').on('click', function() {
      var isChecked = $(this).prop('checked');
      console.log(isChecked)
      var changedElement = document.getElementsByClassName('search-field')[0]
      if (isChecked) {
        changedElement.id = "query_address_cont"
        changedElement.name = "query[address_cont]"
      }
      else {
        document.getElementsByClassName('search-field').id = "query_name_or_address_or_faculity_or_region_cont"
        changedElement.name = "query[name_or_address_or_faculity_or_region_cont]"
      }
    });

    $('#btn-check-region').on('click', function() {
      var isChecked = $(this).prop('checked');
      console.log(isChecked)
      var changedElement = document.getElementsByClassName('search-field')[0]
      if (isChecked) {
        changedElement.id = "query_region_cont"
        changedElement.name = "query[region_cont]"
      }
      else {
        document.getElementsByClassName('search-field').id = "query_name_or_address_or_faculity_or_region_cont"
        changedElement.name = "query[name_or_address_or_faculity_or_region_cont]"
      }
    });

    $('#btn-check-faculity').on('click', function() {
      var isChecked = $(this).prop('checked');
      console.log(isChecked)
      var changedElement = document.getElementsByClassName('search-field')[0]
      if (isChecked) {
        changedElement.id = "query_faculity_cont"
        changedElement.name = "query[faculity_cont]"
      }
      else {
        document.getElementsByClassName('search-field').id = "query_name_or_address_or_faculity_or_region_cont"
        changedElement.name = "query[name_or_address_or_faculity_or_region_cont]"
      }
    });
  }
  
}
