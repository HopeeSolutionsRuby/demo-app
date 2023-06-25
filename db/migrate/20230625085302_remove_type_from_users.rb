class RemoveTypeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :type, :string
  end
end
