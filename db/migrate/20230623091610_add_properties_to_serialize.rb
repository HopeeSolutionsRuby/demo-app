class AddPropertiesToSerialize < ActiveRecord::Migration[7.0]
  def change
    add_column :serializes, :properties, :text
  end
end
