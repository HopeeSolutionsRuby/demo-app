import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    console.log("home controller has been connected");
    $(window).on("mouseup", () => {
      $(".popup-table").addClass("hidden-popup");
    });
    $("#popupTrigger").on("click", () => {
      $(".popup-table").toggleClass("hidden-popup");
    });
  }
}
