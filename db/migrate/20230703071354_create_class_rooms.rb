class CreateClassRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :class_rooms do |t|
      t.string :name
      t.string :location
      t.integer :students_count, default: 0

      t.timestamps
    end
  end
end
