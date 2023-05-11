# frozen_string_literal: true

class AddStartDateToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :start_date, :date
  end
end
