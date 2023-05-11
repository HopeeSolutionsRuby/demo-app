# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'bootsnap', require: false
gem 'bootstrap-sass'
gem 'breadcrumbs_on_rails'
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'mysql2'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'redis', '~> 4.0'
gem 'rubocop', require: false
gem 'rubocop-rails', require: false
gem 'sass-rails'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'will_paginate'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
