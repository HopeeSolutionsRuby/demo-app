class CreateUserStis < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stis do |t|
      t.string :type, null: false
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
