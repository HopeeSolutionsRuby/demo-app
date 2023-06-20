class ResetAllFacultyCacheCounters < ActiveRecord::Migration[7.0]
  def up
    Faculty.all.each do |faculty|
      Faculty.reset_counters(faculty.id, :students)
    end
  end

  def down
  end
end
