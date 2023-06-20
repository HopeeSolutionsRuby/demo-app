class ResetAllStudentCacheCounters < ActiveRecord::Migration[7.0]
  def up
    Student.all.each do |student|
      Student.reset_counters(student.id, :results)
    end
  end
  
  def down
    #nothing here
  end
end
