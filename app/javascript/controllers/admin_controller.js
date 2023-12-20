import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connected");
    document.querySelector('.navbar-toggler').addEventListener('click', function () {
      document.querySelector('.sidebar').classList.toggle('d-none');
      document.querySelector('.sidebar').style.width = (document.querySelector('.sidebar').style.width === '250px') ? '100%' : '250px';
      document.querySelector('.nav-footer').classList.toggle('d-none');
      document.querySelector('.body-content').classList.toggle('d-none');
    });
    document.addEventListener('DOMContentLoaded', function () {
        var myCollapse = new bootstrap.Collapse(document.getElementById('collapseExample'), {
            toggle: false
        });
    });
    document.querySelector('.toggle-button').addEventListener('click', function () {
      document.querySelectorAll('.hide-icon').forEach(function(element) {
        element.classList.toggle('d-none');
      });
      document.querySelector('.sidebar-wrapper').style.width = (document.querySelector('.sidebar-wrapper').style.width === '250px') ? '70px' : '250px';
      document.querySelector('.nav-footer').style.width = (document.querySelector('.nav-footer').style.width === '250px') ? '70px' : '250px';
      document.querySelector('.change-icon').className = (document.querySelector('.change-icon').className === 'fa-solid fa-arrow-left change-icon') ? 'fa-solid fa-right-from-bracket change-icon' : 'fa-solid fa-arrow-left change-icon'
    });
    
  }
}
