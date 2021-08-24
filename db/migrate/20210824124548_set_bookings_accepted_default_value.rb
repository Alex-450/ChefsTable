class SetBookingsAcceptedDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :accepted, :boolean, default: false
  end
end
