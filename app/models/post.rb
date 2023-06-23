# frozen_string_literal: true

class Post < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user, counter_cache: true

  enum :state, %i[pending published hidden]
end
