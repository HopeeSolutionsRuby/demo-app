class AddIndexToStudents < ActiveRecord::Migration[7.0]
  def change
    add_index :students, :name, unique: true
  end
end
