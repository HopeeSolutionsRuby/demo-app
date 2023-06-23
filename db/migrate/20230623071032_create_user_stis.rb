class CreateUserStis < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stis do |t|
      t.string :type, null: false
      t.string :name

      t.timestamps
    end
  end
end
