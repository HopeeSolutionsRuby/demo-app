# frozen_string_literal: true

class RenameColumnInClinic < ActiveRecord::Migration[7.1]
  def change
    rename_column :clinics, :address, :service_information
    rename_column :clinics, :region, :insurance_infomation
  end
end
