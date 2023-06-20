# frozen_string_literal: true

class UserSti < ApplicationRecord
  has_many :posts, dependent: :restrict_with_exception

  validates :first_name, presence: true
  validates :last_name, presence: true
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
