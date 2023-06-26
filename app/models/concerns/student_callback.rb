# frozen_string_literal: true

module StudentCallback
  extend ActiveSupport::Concern
  included do
    before_validation :check_name
    # after_initialize :init
  end

  # def init
  #   self.name ||= 'Tu Nguyen'
  #   self.year ||= 4
  #   self.faculty_id ||= 8
  # end

  def check_name
    return unless name == 'Tu dep trai'

    Rails.logger.debug 'Nah nah! This is a beautiful name'
    throw :abort
  end
end
