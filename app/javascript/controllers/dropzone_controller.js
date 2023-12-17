import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "previewContainer"];

  connect() {
    this.inputTarget.addEventListener("change", this.previewImages.bind(this));
    // this.previewContainerTarget.addEventListener(
    //   "dragover",
    //   this.handleDragOver.bind(this)
    // );
    // this.previewContainerTarget.addEventListener(
    //   "drop",
    //   this.handleDrop.bind(this)
    // );
  }

  previewImages() {
    const files = this.inputTarget.files;
    if (files && files.length > 0) {
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

  handleDragOver(event) {
    event.preventDefault();
    event.stopPropagation();
    event.dataTransfer.dropEffect = "copy";
  }

  handleDrop(event) {
    event.preventDefault();
    event.stopPropagation();

    const files = event.dataTransfer.files;
    this.inputTarget.files = files;

    this.previewImages();
  }
}
