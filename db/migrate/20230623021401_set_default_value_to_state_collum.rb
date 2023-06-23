class SetDefaultValueToStateCollum < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :state, 0
  end
end
