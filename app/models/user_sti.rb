# frozen_string_literal: true

class UserSti < ApplicationRecord
  has_many :posts, dependent: :restrict_with_exception
end

class StudentSti < UserSti
  def sing
    Rails.logger.debug 'La la la'
  end
end

class TeacherSti < UserSti
  def hello
    Rails.logger.debug 'Hello Students'
  end
end
