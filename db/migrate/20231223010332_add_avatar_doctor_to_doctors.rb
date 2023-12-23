# frozen_string_literal: true

class AddAvatarDoctorToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :avatar_doctor, :string, null: false
  end
end
