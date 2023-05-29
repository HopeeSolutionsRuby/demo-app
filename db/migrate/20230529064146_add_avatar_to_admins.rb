class AddAvatarToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :avatar, :string
  end
end
