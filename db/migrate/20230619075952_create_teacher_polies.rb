class CreateTeacherPolies < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_polies do |t|
      t.string :name
      t.string :department
      t.integer :year_of_experience

      t.timestamps
    end
  end
end
