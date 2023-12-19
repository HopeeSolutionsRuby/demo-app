import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "previewContainer"];
  images = []; // To keep track of object URLs

  connect() {
    this.inputTarget.addEventListener("change", this.previewImages.bind(this));
    this.inputTarget.addEventListener("input", this.handleInput.bind(this));
    this.previewContainerTarget.addEventListener(
      "click",
      this.deleteImage.bind(this)
    );
  }

  handleInput() {
    if (!this.inputTarget.value) {
      $(".drag").removeClass("d-none");
      const preview = this.previewContainerTarget;
      const existingImages = preview.querySelectorAll(".preview-image");
      existingImages.forEach((image) => {
        URL.revokeObjectURL(image.src); // Revoke object URLs
        image.remove();
      });
      this.images = []; // Reset the images array
    }
  }

  previewImages() {
    const files = this.inputTarget.files;
    if (files && files.length > 0) {
      $(".drag").addClass("d-none");
      const preview = this.previewContainerTarget;
      const existingImages = preview.querySelectorAll(".preview-image");
      existingImages.forEach((image) => {
        image.remove();
      });
      this.handleInput(); // Clear previous images
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const img = document.createElement("img");
        img.src = URL.createObjectURL(file); // Obtain local file path
        img.classList.add("preview-image");
        img.setAttribute("data-name", file.name);
        preview.appendChild(img);
      }
    }
  }

  deleteImage(event) {
    if (event.target.classList.contains("preview-image")) {
      const confirmed = confirm("Are you sure you want to delete this image?");
      if (confirmed) {
        event.target.remove();
        const fileToRemove = event.target.getAttribute("data-name");
        const files = Array.from(this.inputTarget.files);
        const updatedFiles = files.filter((file) => {
          return file.name !== fileToRemove;
        });

        const newFileList = new DataTransfer();
        updatedFiles.forEach((file) => {
          newFileList.items.add(file);
        });

        this.inputTarget.files = newFileList.files;
      }
    }
  }
}
