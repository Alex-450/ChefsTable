class ChefProfile < ApplicationRecord
  CUISINES = ['Italian', 'French', 'Vegan', 'Indonesian', 'Japanese', 'Chinese', 'Russian']
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates_presence_of :cuisines, :location, :photo, :user_id
  has_many :reviews, through: :bookings

  include PgSearch::Model
  pg_search_scope :search_by_cuisines_and_location_and_description,
    against: [ :cuisines, :location, :description ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_cuisines,
    against: :cuisines,
    using: {
      tsearch: { prefix: true }
    }
end
