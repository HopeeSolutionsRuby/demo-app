class AddDetailsToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :full_name, :string, null: false
    add_column :admins, :age, :integer, null: false
    add_column :admins, :gender, :integer, default: 0, null: false
  end
end
