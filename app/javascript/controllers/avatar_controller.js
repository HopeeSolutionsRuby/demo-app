import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const subjectElement = document.querySelector('.subject-image');
    $(function () {
      var readURL = function (input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $(".profile-pic").attr("src", e.target.result);
            subjectElement.classList.add('hidden');
          };
          reader.readAsDataURL(input.files[0]);
        }
      };
      $(".file-upload").on("change", function () {
        readURL(this);
      });
      $(".upload-button").on("click", function () {
        $(".file-upload").click();
      });
    });
  }
}
