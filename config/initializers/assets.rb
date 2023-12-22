# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w[bootstrap.min.js popper.js]
Rails.application.config.assets.precompile += %w[jquery.min.js bootstrap-datepicker.min.js]
