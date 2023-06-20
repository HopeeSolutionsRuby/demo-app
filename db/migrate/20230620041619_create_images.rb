class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, null: false
      t.text :link
      t.text :description

      t.timestamps
    end
  end
end
