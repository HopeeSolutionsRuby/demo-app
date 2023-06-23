# frozen_string_literal: true

# C
class AddDescriptionsToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :descriptions, :text
  end
end
