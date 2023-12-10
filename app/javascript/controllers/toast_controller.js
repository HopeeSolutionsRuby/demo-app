import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const toastEl = document.querySelector(".toast");

    const toast = new bootstrap.Toast(toastEl);
    toast.show();
  }
}
