// phone_mask_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello");
    const inputmask = Inputmask({ mask: "9999 999 999" });
    inputmask.mask(this.element);  
  }
}
