# frozen_string_literal: true

class AddCartIdToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :cart_id, :integer
  end
end
