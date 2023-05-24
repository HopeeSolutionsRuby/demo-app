# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "application", preload: true do
  pin "@popperjs/core", to: "popper.js", require: "popper.js/dist/umd/popper"
  pin "@bootstrap", to: "bootstrap.js", require: "bootstrap/dist/js/bootstrap"
end
