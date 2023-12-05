import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="home"
export default class extends Controller {
  connect() {
    console.log("home controller has been connected");
    $("#popupTrigger").on("click", (e) => {
      e.stopPropagation(); // Ngăn chặn sự kiện lan ra các phần tử cha
      $(".popup-table").toggleClass("hidden-popup");
    });
    
    $(window).on("mouseup", (event) => {
      if (!$(".popup-table").hasClass("hidden-popup")) {
        if (!event.target.closest("#popupTrigger")) {
          $(".popup-table").addClass("hidden-popup");
        }
      }
    });
    
    
    
    // $("#popupMore").on("click", () => {
    //   $(".popup-more").toggleClass("hidden-popup");
    // });
  }
}
