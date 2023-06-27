class CreateFirms < ActiveRecord::Migration[7.0]
  def change
    create_table :firms do |t|

      t.timestamps
    end
  end
end
