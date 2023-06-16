class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :student, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.float :point

      t.timestamps
    end
  end
end
