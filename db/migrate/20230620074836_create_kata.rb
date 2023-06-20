class CreateKata < ActiveRecord::Migration[7.0]
  def change
    create_table :kata do |t|
      t.string :kata_title
      t.text :kata_body

      t.timestamps
    end
  end
end
