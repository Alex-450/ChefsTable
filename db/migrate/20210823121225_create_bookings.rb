class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.references :user, null: false, foreign_key: true
      t.references :chef_profile, null: false, foreign_key: true
      t.boolean :accepted
      t.string :cuisine
      t.string :location

      t.timestamps
    end
  end
end
