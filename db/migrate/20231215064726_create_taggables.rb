class CreateTaggables < ActiveRecord::Migration[7.1]
  def change
    create_table :taggables do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
