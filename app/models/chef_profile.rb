class ChefProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one :photo
end
