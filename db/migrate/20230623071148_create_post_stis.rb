class CreatePostStis < ActiveRecord::Migration[7.0]
  def change
    create_table :post_stis do |t|
      t.references :user_stis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
