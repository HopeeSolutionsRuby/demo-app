# frozen_string_literal: true

class UserSti < ApplicationRecord
  has_many :posts, dependent: :restrict_with_exception
end

class LectureSti < UserSti
  def sing
    Rails.logger.debug 'abc'
  end
end

class StudentSti < UserSti
  def hello
    Rails.logger.debug 'ABC'
  end
end
