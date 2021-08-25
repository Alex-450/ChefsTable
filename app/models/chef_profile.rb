class ChefProfile < ApplicationRecord
  CUISINE = ["french", "italian", "russian", "indian", "japanese", "chinese"]

  belongs_to :user
  has_many :bookings
end
