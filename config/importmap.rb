# frozen_string_literal: true

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'jquery', to: 'jquery.min.js', preload: true
pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
