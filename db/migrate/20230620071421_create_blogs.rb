class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :name, null: false
      t.text :short_description
      t.text :content

      t.references :admin, null: false, foreign_key: true
      t.timestamps
    end
  end
end
