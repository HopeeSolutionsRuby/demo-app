# frozen_string_literal: true

class Post < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  enum :state, %i[pending published hidden]
end
