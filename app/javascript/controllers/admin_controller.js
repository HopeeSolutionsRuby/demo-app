import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        document.querySelector('.navbar-toggler').addEventListener('click', function () {
            document.querySelector('.sidebar').classList.toggle('d-none');
            document.querySelector('.viewbtn').classList.toggle('d-none');
        });
    }
}