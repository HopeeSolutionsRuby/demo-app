# frozen_string_literal: true

class ChangeAdminNameToUserName < ActiveRecord::Migration[7.1]
  def change
    rename_column :admins, :admin_name, :username
  end
end
