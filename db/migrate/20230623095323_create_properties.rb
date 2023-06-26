class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|

      t.timestamps
    end
  end
end
