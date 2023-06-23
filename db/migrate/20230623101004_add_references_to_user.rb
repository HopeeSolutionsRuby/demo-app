class AddReferencesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :references, :text
  end
end
