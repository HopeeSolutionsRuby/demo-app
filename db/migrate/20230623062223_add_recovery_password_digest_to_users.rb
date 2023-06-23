class AddRecoveryPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :recovery_password_digest, :string
  end
end
