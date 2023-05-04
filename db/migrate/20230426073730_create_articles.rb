# frozen_string_literal: true

# active record
class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
