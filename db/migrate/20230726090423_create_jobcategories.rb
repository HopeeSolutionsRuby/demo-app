# frozen_string_literal: true

class CreateJobcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :jobcategories do |t|
      t.string :category_name
      t.string :country
      t.string :job_category_status
      t.text :description
      t.timestamps
    end
  end
end
