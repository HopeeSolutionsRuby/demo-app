class CreateTerms < ActiveRecord::Migration[7.0]
  def change
    create_table :terms do |t|
      t.references :subject, null: false, foreign_key: true
      t.integer :semester
      t.integer :year
      t.string :teacher

      t.timestamps
    end
  end
end
