# frozen_string_literal: true

class Lab < ApplicationRecord
  belongs_to :user
  belongs_to :professor
  belongs_to :course
  has_many :teaching_assistants, as: :ta_duty, dependent: :destroy
end
