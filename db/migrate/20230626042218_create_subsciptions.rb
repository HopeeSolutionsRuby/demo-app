class CreateSubsciptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subsciptions do |t|

      t.timestamps
    end
  end
end
