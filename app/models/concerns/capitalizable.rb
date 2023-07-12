# frozen_string_literal: true

module Capitalizable
  extend ActiveSupport::Concern

  class_methods do
    def capitalize_attribute(attribute)
      before_validation do
        self[attribute] = self[attribute].to_s.titleize if attribute.present?
      end
    end
  end
end
