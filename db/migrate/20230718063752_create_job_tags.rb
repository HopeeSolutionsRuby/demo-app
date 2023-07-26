# frozen_string_literal: true

class CreateJobTags < ActiveRecord::Migration[7.0]
  def change
    create_table :job_tags do |t|
      t.string :country
      t.integer :job_category_id
      t.integer :job_id
      t.text :description, limit: 60
      t.timestamps
    end
  end
end
