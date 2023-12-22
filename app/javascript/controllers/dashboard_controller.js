import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $('#datepicker').datepicker({
      format: "mm-yyyy",
      viewMode: "months", 
      minViewMode: "months"
    });
  }
}
