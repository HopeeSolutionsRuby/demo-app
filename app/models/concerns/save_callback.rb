# frozen_string_literal: true

module SaveCallback
  extend ActiveSupport::Concern

  included do
    before_save :add_f
    after_save :say_something
  end
  def add_f
    Rails.logger.debug 'I will put a F in front of you'
    self.name = "F_#{name}"
  end

  def say_something
    Rails.logger.debug 'Ok nice try'
  end
end
