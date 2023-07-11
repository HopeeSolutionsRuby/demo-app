//collapsed menu
$(document).ready(function () {
  $('[data-target^="#collapse"]').click(function (e) {
    e.preventDefault();
    var target = $(this).attr("data-target");
    $(target).collapse("toggle");
  });
});
$(document).ready(function () {
  $(".collapse").on("show.bs.collapse", function () {
    $(this).prev().find(".collapse-icon").toggleClass("rotate rotate-back");
  });

  $(".collapse").on("hide.bs.collapse", function () {
    $(this).prev().find(".collapse-icon").toggleClass("rotate-back rotate ");
  });
});

// toggle menu admin layout
$(document).ready(function () {
  $("#toggle-button").click(function () {
    $(".toggle").toggle();
    $("#menu-container").toggleClass("col-lg-2 col-lg-1");
    $("#content-container").toggleClass("col-lg-10 col-lg-11");
  });
});
