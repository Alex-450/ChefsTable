class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chef_profile
  validates_presence_of :booking_date, :user_id, :chef_profile_id, :cuisine, :location
end
