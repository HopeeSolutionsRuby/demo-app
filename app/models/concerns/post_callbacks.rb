module PostCallbacks
  extend ActiveSupport::Concern

  included do
    around_save :log_save
  end

  def log_save
    Rails.logger.debug 'Before saving the post'
    yield
    Rails.logger.debug 'After saving the post'
  end
end
