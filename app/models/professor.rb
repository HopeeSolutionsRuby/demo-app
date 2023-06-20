class Professor < ActiveRecord::Base
  has_many :teaching_assistants
  has_many :courses, through: :teaching_assistants, source: :ta_duty, source_type: "Course"
  has_many :labs, through: :teaching_assistants, source: :ta_duty, source_type: "Lab"
end
