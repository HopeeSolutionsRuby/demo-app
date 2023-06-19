class CreateStudentPolies < ActiveRecord::Migration[7.0]
  def change
    create_table :student_polies do |t|
      t.string :name
      t.string :faculty

      t.timestamps
    end
  end
end
