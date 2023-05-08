class AddUserIdToProfessor < ActiveRecord::Migration[7.0]
  def change
    add_column :professors, :user_id, :integer
  end
end
