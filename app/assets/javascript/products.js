$(document).ready(function () {
  $(".page-link-ajax").click(function (event) {
    event.preventDefault(); // Prevent the default link behavior
    var url = $(this).attr("href"); // Get the URL from the clicked link

    $.ajax({
      url: url,
      type: "GET",
      dataType: "script", // Expecting JavaScript response
      success: function (data) {
        console.log(data);
      },
      error: function (xhr, status, error) {
        // Handle errors here (if needed)
      },
    });
  });
});
