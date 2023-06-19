class AddOrdersCountToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :orders_count, :integer
  end
end
