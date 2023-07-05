# frozen_string_literal: true

class Student < ApplicationRecord
  include GeneralCallbacks
  belongs_to :class_room, counter_cache: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  def self.ransackable_attributes(aucth_object = nil)
    ["created_at", "email", "id", "first_name", "first_name","updated_at"]
  end

  def enroll(class_room)
    ActiveRecord::Base.transaction do
      self.class_room = class_room
      save!
      class_room.update!(students_count: class_room.students.count)
    end
  rescue ActiveRecord::RecordInvalid => e
    puts "Enrollment failed: #{e.message}"
    rollback_enrollment_changes
  end

  private

  def rollback_enrollment_changes
    self.class_room = nil
    save!
  end
end
