// table_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $("#popupTrigger").on("click", (e) => {
      e.stopPropagation();
      $(".popup-table").toggleClass("hidden-popup");
    });
    $("#more").on("click", (e) => {
      e.stopPropagation();
      $(".table-responsive").toggleClass("hidden-table");
    });

    $(window).on("mouseup", (event) => {
      if (!$(".popup-table").hasClass("hidden-popup")) {
        if (!event.target.closest("#popupTrigger")) {
          $(".popup-table").addClass("hidden-popup");
        }
      }
      if (!$(".table-responsive").hasClass("hidden-table")) {
        if (!event.target.closest("#more")) {
          $(".table-responsive").addClass("hidden-table");
        }
      }
    });
  }
}
