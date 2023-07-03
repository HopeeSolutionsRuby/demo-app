class AddDetailsToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :address, :string
    add_column :students, :city, :string
    add_column :students, :province, :string
    add_column :students, :age, :integer
  end
end
