class AddDetailsToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :full_name, :string, null: false
    add_column :customers, :age, :integer, null: false
    add_column :customers, :gender, :integer, default: 0, null: false
  end
end
