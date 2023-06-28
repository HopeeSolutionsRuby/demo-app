$(document).ready(function () {
  $(".ajax-item").on("click", function (event) {
    event.preventDefault(); // Prevent the default behavior of the element

    var url = $(this).find("a").attr("href");

    $.ajax({
      url: url,
      type: "GET",
      dataType: "script",
      success: function (data) {
        // Xử lý khi Ajax thành công
        console.log("Ajax request succeeded!");
      },
      error: function (jqXHR, textStatus, errorThrown) {
        // Xử lý khi xảy ra lỗi Ajax
        console.error("Ajax request failed:", textStatus, errorThrown);
      },
    });
  });
});
