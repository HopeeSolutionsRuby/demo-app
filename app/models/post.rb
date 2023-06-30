# frozen_string_literal: true

class Post < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  # validates_associated :user, :comments
  enum :state, %i[pending published hidden]
end
