class AddEmailToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :email, :string
  end
end
