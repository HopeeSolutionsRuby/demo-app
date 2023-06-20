class AddResultsCountToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :results_count, :integer
  end
end
