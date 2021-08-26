class ChefProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates_presence_of :cuisines, :location, :photo, :user_id
  has_many :reviews, through: :bookings
end
