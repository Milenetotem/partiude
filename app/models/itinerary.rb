class Itinerary < ActiveRecord::Base

  attr_accessible :name, :transport_type, :origin, :destiny, :day, :hour, :repeat_in

  belongs_to :user
  has_many :points

  has_enumeration_for :repeat_in
  has_enumeration_for :transport_type, :create_helpers => {:prefix => true}

  accepts_nested_attributes_for :points, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :origin
  validates_presence_of :destiny
  validates_presence_of :repeat_in
  validates_presence_of :transport_type
  # validates_presence_of :user
  validates_presence_of :day
  validates_presence_of :hour

  def origin_coordinates
    Geocoder.coordinates(origin)
  end

  def destiny_coordinates
    Geocoder.coordinates(destiny)
  end

end
