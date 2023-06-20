class TeachingAssistant < ActiveRecord::Base
	belongs_to :professors
  belongs_to :ta_duty, polymorphic: true
end