import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $('#filter_month').datepicker({
      format: "yyyy-mm",
      minViewMode: 1
    })
  }
}
