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

  validate :check_origin_and_destiny_address, :on => :create

  def origin_coordinates
    [].tap do |coord|
      coordination = Geocoder.search(origin)[0]
      coord[0] = coordination.latitude
      coord[1] = coordination.longitude
    end if origin.present?
  end

  def destiny_coordinates
    [].tap do |coord|
      coordination = Geocoder.search(destiny)[0]
      coord[0] = coordination.latitude
      coord[1] = coordination.longitude
    end if destiny.present?
  end

private
  def check_origin_and_destiny_address
    errors.add(:origin, :invalid_address) unless origin_coordinates.present?
    errors.add(:destiny, :invalid_address) unless destiny_coordinates.present?
  end

end
