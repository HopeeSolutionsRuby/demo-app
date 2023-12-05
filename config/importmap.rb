# frozen_string_literal: true

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
<<<<<<< HEAD
pin '@popperjs/core', to: 'popper.js', preload: true
=======
pin 'jquery', to: 'jquery.min.js', preload: true
pin 'popper', to: 'popper.js', preload: true
>>>>>>> 4e61298 ([Issue 33]: Fix Reviews)
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin "jquery", to: "jquery.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "jquery-ui", to: "jquery-ui.min.js", preload: true
