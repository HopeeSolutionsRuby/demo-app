class CreateSerializes < ActiveRecord::Migration[7.0]
  def change
    create_table :serializes do |t|

      t.timestamps
    end
  end
end
