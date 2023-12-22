class RenameColumnInClinic < ActiveRecord::Migration[7.1]
  def change
    rename_column :clinics, :address, :service_information
    rename_column :clinics, :region, :insurance_infomation
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
