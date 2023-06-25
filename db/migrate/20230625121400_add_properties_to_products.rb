class AddPropertiesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :properties, :text
  end
end
