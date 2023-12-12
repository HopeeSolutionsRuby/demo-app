class AddUsernameToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_index :admins, :username, unique: true
  end
end
