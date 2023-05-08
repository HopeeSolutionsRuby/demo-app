# frozen_string_literal: true

class AddSubmitStatusToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :submit_status, :boolean, default: 'false'  
  end
end
