module UserCallbacks
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_name
    before_save :normalize_email
    around_save :log_save
  end
  def log_save
    Rails.logger.debug 'Before saving the user'
    yield
    Rails.logger.debug 'After saving the user'
  end

  def normalize_name
    self.name = name.downcase if name.present?
  end

  def normalize_email
    self.email = email.downcase if email.present?
  end
end
