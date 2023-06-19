# frozen_string_literal: true

module CategoryActivities
  extend ActiveSupport::Concern

  included do
    before_save :before_save_refresh_name
    after_save :after_save_notify
    before_destroy :before_destroy_notify

    def method_missing(method_name, *_arg)
      Rails.logger.debug { "Error: #{method_name} method is not defined" }
    end

    def respond_to_missing?(method_name, include_private = false)
      super
    end
  end

  def before_save_refresh_name
    self.name = 'NOOOO' if name.downcase == 'loop'
    Rails.logger.debug { "before_save category #{id} - refresh name" }
  end

  def after_save_notify
    Rails.logger.debug { "after_save #{category.name}" }
  end

  def before_destroy_notify
    if name.downcase == 'faked'
      Rails.logger.debug 'before_destroy "faked"'
    else
      Rails.logger.debug 'before_destroy'
    end
  end
end
