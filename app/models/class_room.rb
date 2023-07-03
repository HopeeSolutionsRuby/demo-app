# frozen_string_literal: true

class ClassRoom < ApplicationRecord
  include GeneralCallbacks
  has_many :students, dependent: :destroy
end
