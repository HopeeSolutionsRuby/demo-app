# frozen_string_literal: true

# Class model for Student
class Student < ApplicationRecord
  include Validators
  has_many :blogs, dependent: :destroy
  has_many :student_projects, dependent: :destroy
  has_many :projects, through: :student_projects

  scope :student_name_duc, -> { where('first_name' => 'Duc') }

  after_create :display_student_age
  after_commit :upcase_name, if: :name_is_duc?

  def self.ransackable_attributes(_auth_object = nil)
    %w[address blogs_count contact_number created_at dob email first_name id last_name
       updated_at]
  end
end
