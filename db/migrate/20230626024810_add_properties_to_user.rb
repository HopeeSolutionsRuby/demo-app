class AddPropertiesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :properties, :text
  end
end
