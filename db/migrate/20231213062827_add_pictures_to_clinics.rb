# frozen_string_literal: true

# Migration to add pictures to clinics
class AddPicturesToClinics < ActiveRecord::Migration[7.1]
  def change
    add_column :clinics, :pictures, :json
  end
end
