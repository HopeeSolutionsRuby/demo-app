import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $(document).ready(function() {
    $(".datepicker .active").removeClass("active");
});

    $('#filter_month').datepicker({
      format: "yyyy-mm",
      viewMode: "months", 
      minViewMode: "months"
    }).on('changeDate', function(e) {
        const selectedDate = e.date;
        const filterMonth = `${selectedDate.getFullYear()}/${String(selectedDate.getMonth() + 1).padStart(2, '0')}`;
        
        window.location.href = "/administrator/statistics?filter_month=" + filterMonth;     
    });
  }
}
