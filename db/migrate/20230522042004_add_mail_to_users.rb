class AddMailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mail, :string
  end
end
