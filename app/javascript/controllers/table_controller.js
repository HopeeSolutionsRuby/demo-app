// table_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $('#multiple-select-custom-field').select2( {
      theme: "bootstrap-5",
      width: $( this ).data( 'width' ) ? $( this ).data( 'width' ) : $( this ).hasClass( 'w-100' ) ? '100%' : 'style',
      placeholder: $( this ).data( 'placeholder' ),
      closeOnSelect: false,
      tags: true
    });
  }
}
