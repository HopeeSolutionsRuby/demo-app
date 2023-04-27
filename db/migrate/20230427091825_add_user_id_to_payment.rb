class AddUserIdToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :user_id, :int
  end
end
