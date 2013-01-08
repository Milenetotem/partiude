class Point < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  belongs_to :itinerary

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def coordinates
    [latitude, longitude]
  end

end
