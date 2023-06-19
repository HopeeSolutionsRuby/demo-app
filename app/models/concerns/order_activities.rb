# frozen_string_literal: true

module OrderActivities
  extend ActiveSupport::Concern

  included do
    after_create_commit :after_create_commit
    after_update_commit :after_update_commit

    def method_missing(method_name, *_arg)
      Rails.logger.debug { "Error: #{method_name} method is not defined" }
    end

    def respond_to_missing?(method_name, include_private = false)
      super
    end
  end

  def after_create_commit
    Rails.logger.debug { "after_commit_create #{id} - send email create" }
  end

  def after_update_commit
    Rails.logger.debug { "after_commit_update #{id} - send email update" }
  end
end
