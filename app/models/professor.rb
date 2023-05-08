# frozen_string_literal: true

class Professor < ApplicationRecord
  belongs_to :user
  has_many :teaching_assistants, dependent: :destroy
  has_many :course_tas, through: :teaching_assistants, source: :ta_duty, source_type: 'Course', dependent: :destroy
  has_many :lab_tas, through: :teaching_assistants, source: :ta_duty, source_type: 'Lab', dependent: :destroy
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_save :capitalize_name
  after_create :send_welcome_email

  private

  def capitalize_name
    self.name = name.capitalize
  end

  def send_welcome_email
    ProfessorMailer.with(professor: self).welcome_email.deliver_later
  end
end
