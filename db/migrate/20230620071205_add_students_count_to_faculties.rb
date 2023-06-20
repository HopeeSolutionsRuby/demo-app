class AddStudentsCountToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :students_count, :integer 
  end
end
