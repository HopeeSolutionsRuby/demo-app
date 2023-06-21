# frozen_string_literal: true

module FindCallback
  extend ActiveSupport::Concern

  included do
    after_find :hura
  end
  def hura
    Rails.logger.debug 'Huraaa!'
  end
end
