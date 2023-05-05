# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  validate :contain_letter
  before_save :update_profile

  private

  def contain_letter
    return false if date_of_birth.match(/[a-zA-Z]/)
  end

  def update_profile
    profile = build_profile unless self.profile
    profile.date_of_birth = date_of_birth
    profile.sex = sex
    profile.address = address
    profile.save
  end
end
