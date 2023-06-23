class RemoveReferencesFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :references
  end
end
