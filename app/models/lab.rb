# frozen_string_literal: true

class Lab < ApplicationRecord
  belongs_to :user
  belongs_to :professor
  belongs_to :course
  has_many :teaching_assistants, as: :ta_duty, dependent: :destroy
  before_commit :check_status
  validate :start_date_cannot_be_in_the_past

  private

  def check_status
    flash[:notice] = 'You had submit this lab' if submit_status == true && !user_id.nil?
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
