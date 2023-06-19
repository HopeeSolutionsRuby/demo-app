class UserSti < ApplicationRecord
  has_many :posts
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
