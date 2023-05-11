# frozen_string_literal: true

class AddProfessorIdToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :professor_id, :integer
  end
end
