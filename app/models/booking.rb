class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ChefProfile
  validates_presence_of :booking_date, :user_id, :chef_profile_id, :cuisine, :location, :accepted
  after_initialize :set_defaults

  def set_defaults
    self.accepted ||= nil
  end
end
