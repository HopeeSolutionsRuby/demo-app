class AddProductsCountToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :products_count, :integer
  end
end
