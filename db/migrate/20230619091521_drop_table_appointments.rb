class DropTableAppointments < ActiveRecord::Migration[7.0]
  def change
    drop_table :appointments
  end
end
