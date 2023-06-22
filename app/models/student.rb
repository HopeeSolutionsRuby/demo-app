# frozen_string_literal: true

# Class model for Student
class Student < ApplicationRecord
  # include Basicvalidate

  has_many :blogs, dependent: :destroy
  has_many :student_projects, dependent: :destroy
  has_many :projects, through: :student_projects

  validates :first_name, :last_name, :contact_number, :email, presence: true
  validates :contact_number, :email, uniqueness: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
                                               message: 'only allows letters' }

  scope :student_name_duc, -> { where('first_name' => 'Duc') }

  after_create :display_student_age
  after_commit :upcase_name, if: :name_is_duc?

  def display_student_age
    if dob.present?
      age = Date.today.year - dob.year
      puts "===Age of student is #{age}==="
    else
      puts '===Age cannot be calculated without date of birth==='
    end
  end

  def name_is_duc?
    first_name == 'Duc'
  end

  def upcase_name
    first_name.upcase
    last_name.upcase
    puts 'name has been capitalized'
  end
end
