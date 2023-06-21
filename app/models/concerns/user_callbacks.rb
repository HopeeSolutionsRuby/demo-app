# frozen_string_literal: true

module UserCallbacks
  extend ActiveSupport::Concern

  included do
    before_create :build_profile_if_none
  end
  def build_profile_if_none
    if profile.nil?
      build_profile(name: name, age: rand(18..60))
    else
      Rails.logger.debug 'User already has a Profile'
      throw(:abort)
    end
  end
end
