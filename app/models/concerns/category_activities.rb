# frozen_string_literal: true

module CategoryActivities
  extend ActiveSupport::Concern

  included do
    before_save :before_save
    after_save :after_save
    before_destroy :before_destroy

    def method_missing(method_name, *_arg)
      Rails.logger.debug { "Error: #{method_name} method is not defined" }
    end

    def respond_to_missing?(method_name, include_private = false)
      super
    end
  end

  def before_save
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
    Rails.logger.debug { "before_save category #{name} - refresh name" }
  end

  def after_save
    Rails.logger.debug { "after_save #{name}" }
  end

  def before_destroy
    Rails.logger.debug { "before_destroy #{name}" }
  end
end
