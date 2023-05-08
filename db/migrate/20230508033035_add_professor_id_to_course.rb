class AddProfessorIdToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :professor_id, :integer
  end
end
