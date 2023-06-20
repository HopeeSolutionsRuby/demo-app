class CreateSolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :solutions do |t|
      t.string :solution_body

      t.timestamps
    end
  end
end
