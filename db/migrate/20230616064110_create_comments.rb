class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commentable, polymorphic: true, null: false
      t.references :owner, polymorphic: true, null: false
      t.integer :replies_count
      t.integer :parent_id

      t.timestamps
    end

    add_index :comments, :parent_id
  end
end
