class CreateVipUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :vip_users do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points
      t.integer :rank

      t.timestamps
    end
  end
end
