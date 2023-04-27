class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :phone, default: '00000000'
      t.timestamps
    end
  end
end
