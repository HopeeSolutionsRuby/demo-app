import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const toastEl = document.querySelector(".toast");

    // Show the toast
    const toast = new bootstrap.Toast(toastEl);
    toast.show();

    var displayTime = 5000;
    var disposeTime = 500;
    setTimeout(function () {
      toast.hide();

      setTimeout(() => {
        toast.dispose();
      }, disposeTime);
    }, displayTime);

    //Customs hiden the toast
    // const custToast = document.getElementById("cus-toast");
    // var displayTime = 5000;
    // setTimeout(function () {
    //   toast.hide();
    // }, displayTime);
  }
}
