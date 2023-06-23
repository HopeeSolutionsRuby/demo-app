class Serialize < ApplicationRecord
  serialize :data, Duration
  delegate :hours, :hours=, :minutes, :minutes=, :seconds, :seconds=, to: :data
end
