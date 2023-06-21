class AddColumnStatusToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :status, :integer
  end
end
