# frozen_string_literal: true

module OrderActivities
  module CallBacks
    extend ActiveSupport::Concern

    included do
      after_create :after_create
      after_update :after_update
      after_destroy :after_destroy

      def method_missing(method_name, *_arg)
        Rails.logger.debug { "Error: #{method_name} method is not defined" }
      end

      def respond_to_missing?(method_name, include_private = false)
        super
      end
    end

    def after_create
      Rails.logger.debug { "after_create #{id} - send email create" }
    end

    def after_update
      Rails.logger.debug { "after_update #{id} - send email update" }
    end

    def after_destroy
      Rails.logger.debug { "after_destroy #{id} - send email destroy" }
    end
  end
  
  module Scope
    extend ActiveSupport::Concern

    included do
      
    end
  end
end
