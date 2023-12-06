import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    $("#popupTrigger").on("click", (e) => {
      e.stopPropagation();
      $(".popup-table").toggleClass("hidden-popup");
    });

    $(window).on("mouseup", (event) => {
      if (!$(".popup-table").hasClass("hidden-popup")) {
        if (!event.target.closest("#popupTrigger")) {
          $(".popup-table").addClass("hidden-popup");
        }
      }
    });
  }
}
