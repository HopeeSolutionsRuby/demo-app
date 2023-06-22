# frozen_string_literal: true

# E
class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :rvtable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
