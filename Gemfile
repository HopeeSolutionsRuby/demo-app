# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'bootstrap', '~> 5.1.3'
gem 'factory_bot_rails'
gem 'figaro'
gem 'mysql2'
gem 'rubocop', require: false
gem 'rubocop-rails', require: false
gem 'sass-rails'

gem 'bootsnap', require: false
gem 'carrierwave', '~> 3.0'
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'faker'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'web-console'
end
