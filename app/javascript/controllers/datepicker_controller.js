import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log('dasdasd');
    $('#filter_month').datepicker({
      format: "yyyy-mm",
      minViewMode: 1
    })
  }
}
