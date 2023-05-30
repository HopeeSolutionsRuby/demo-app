(function($) {

  "use strict";

  $(".toggle-password").click(function() {

    $(this).toggleClass("fa-eye fa-eye-slash");
    var input = $($(this).attr("toggle"));
    if (input.attr("type") == "password") {
      input.attr("type", "text");
    } else {
      input.attr("type", "password");
    }
  });

})(jQuery);


$(document).ready(function() {
  // Lắng nghe sự kiện thay đổi trường tệp
  $('input[type="file"]').on('change', function() {
    var fileInput = $(this);
    var file = fileInput[0].files[0];
    
    if (file) {
      // Tạo đường dẫn tới file tải lên
      var fileReader = new FileReader();
      fileReader.onload = function(e) {
        // Thay đổi hình ảnh hiển thị thành avatar tải lên
        $('#avatar-preview').attr('src', e.target.result);
      };
      fileReader.readAsDataURL(file);
    } else {
      // Nếu không có file được chọn, hiển thị avatar mặc định
      $('#avatar-preview').attr('src', '/path/to/default/avatar.png');
    }
  });
});