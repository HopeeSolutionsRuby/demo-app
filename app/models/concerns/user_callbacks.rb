# frozen_string_literal: true
require 'faker'

module UserCallbacks
  extend ActiveSupport::Concern

  included do
    before_create :build_profile_if_none
    after_create :build_post
  end
  def build_profile_if_none
    if profile.nil?
      build_profile(name: name, age: rand(18..60), email: Faker::Internet.unique.email)
    else
      Rails.logger.debug 'User already has a Profile'
      throw(:abort)
    end
  end
  def build_post
    posts.build(title: "WELCOME TO  #{host.name} ", body: "introduction", state: 1)
  end
end
