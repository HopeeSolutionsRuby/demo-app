import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "previewContainer"];
  connect() {
    this.inputTarget.addEventListener("change", this.previewImages.bind(this));
    this.inputTarget.addEventListener("input", this.handleInput.bind(this));
  }

  handleInput() {
    if (!this.inputTarget.value) {
      $(".drag").removeClass("d-none");
      const preview = this.previewContainerTarget;
      const existingImages = preview.querySelectorAll(".preview-image");
      const existingIcons = preview.querySelectorAll(".close-icon");
      existingImages.forEach((image) => {
        image.remove();
      });
      existingIcons.forEach((icon) => {
        icon.remove();
      });
    }
  }

  previewImages() {
    const files = this.inputTarget.files;
    if (files && files.length > 0) {
      $(".drag").addClass("d-none");
      const preview = this.previewContainerTarget;
      const existingImages = preview.querySelectorAll(".preview-image");
      const existingIcons = preview.querySelectorAll(".close-icon");
      existingImages.forEach((image) => {
        image.remove();
      });
      existingIcons.forEach((icon) => {
        icon.remove();
      });
      this.handleInput();
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const imgContainer = document.createElement("div");
        imgContainer.classList.add("image-container");
        const img = document.createElement("img");
        img.src = URL.createObjectURL(file);
        img.classList.add("preview-image");
        img.setAttribute("data-name", file.name);
        imgContainer.appendChild(img);

        const closeIcon = document.createElement("span");
        closeIcon.innerHTML = "&times;";
        closeIcon.classList.add("close-icon");
        closeIcon.addEventListener("click", this.deleteImage.bind(this));
        imgContainer.appendChild(closeIcon);

        preview.appendChild(imgContainer);
      }
    }
  }

  deleteImage(event) {
    if (event.target.classList.contains("close-icon")) {
      const confirmed = confirm("Are you sure you want to delete this image?");
      if (confirmed) {
        const imageContainer = event.target.parentElement;
        const fileToRemove = imageContainer
          .querySelector(".preview-image")
          .getAttribute("data-name");

        imageContainer.remove();
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
