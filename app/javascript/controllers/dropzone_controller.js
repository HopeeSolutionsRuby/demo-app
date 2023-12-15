import { Controller } from "@hotwired/stimulus";
import Dropzone from "dropzone";

export default class extends Controller {
  static values = {
    userId: String,
  };

  connect() {
    const dropzoneConfig = {
      url: this.url,
      method: "patch",
      clickable: true,
      paramName: "pictures",
      maxFilesize: 256,
      parallelUploads: "5",
      addRemoveLinks: true,
      autoQueue: true,
      autoProcessQueue: false,
      acceptedFiles: ".jpg, .jpeg, .png",
      maxFiles: 10,
      uploadMultiple: true,
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
      },
      clickable: true,
      init: function () {
        const submitButton = document.querySelector("#submitButton");
        submitButton.addEventListener(
          "click",
          function () {
            this.processQueue();
          }.bind(this)
        );
      },
    };

    this.dropzone = new Dropzone(this.element, dropzoneConfig);
  }

  get url() {
    return `/administrator/clinics/${this.userIdValue}`;
  }
}
