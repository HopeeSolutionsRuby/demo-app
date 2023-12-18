import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "previewContainer"];

  connect() {
    this.inputTarget.addEventListener("change", this.previewImages.bind(this));
    this.inputTarget.addEventListener("input", this.handleInput.bind(this));
  }

  handleInput() {
    if (!this.inputTarget.value) {
      $(".form-label").removeClass("d-none"); 
      const preview = this.previewContainerTarget;
      const existingImages = preview.querySelectorAll(".preview-image");
      existingImages.forEach((image) => {
        image.remove();
      });
    }
  }

  previewImages() {
    const files = this.inputTarget.files;
    if (files && files.length > 0) {
      $(".form-label").addClass("d-none");
      const preview = this.previewContainerTarget;
      const existingImages = preview.querySelectorAll(".preview-image");
      existingImages.forEach((image) => {
        image.remove();
      });

      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const reader = new FileReader();

        reader.onload = (event) => {
          const img = new Image();
          img.src = event.target.result;
          img.classList.add("preview-image");
          preview.appendChild(img);
        };

        reader.readAsDataURL(file);
      }
    }
  }
}
