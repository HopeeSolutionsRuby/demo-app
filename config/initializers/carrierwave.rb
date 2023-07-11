require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false if Rails.env.test?
  config.root = Rails.root.join('public')
end
