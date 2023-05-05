# frozen_string_literal: true

class Professor < ApplicationRecord
  belongs_to :user
  has_many :teaching_assistants, dependent: :destroy
  has_many :course_tas, through: :teaching_assistants, source: :ta_duty, source_type: 'Course', dependent: :destroy
  has_many :lab_tas, through: :teaching_assistants, source: :ta_duty, source_type: 'Lab', dependent: :destroy
end
