class CreatePostPolies < ActiveRecord::Migration[7.0]
  def change
    create_table :post_polies do |t|
      t.bigint :postable_id, null: false
      t.string :postable_type, null: false

      t.timestamps
    end
  end
end
