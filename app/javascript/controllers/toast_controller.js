import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const toastEl = document.querySelector(".toast");

    // Show the toast
    const toast = new bootstrap.Toast(toastEl);
    toast.show();

    // Close the toast after 5 seconds
    setTimeout(function () {
      toast.dispose(); // Hide the toast
    }, 5000);
  }
}
