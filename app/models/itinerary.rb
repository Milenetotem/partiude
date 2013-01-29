class Itinerary < ActiveRecord::Base

  attr_accessible :name, :transport_type, :origin, :destiny, :day, :hour, :repeat_in, :user, :recurring

  has_many :points
  has_many :participants
  has_many :users, :through => :participants

  has_one :recurring

  has_enumeration_for :transport_type, :create_helpers => {:prefix => true}
  has_enumeration_for :state, :create_helpers => {:prefix => true}

  accepts_nested_attributes_for :points, :allow_destroy => true
  accepts_nested_attributes_for :participants, :allow_destroy => true
  accepts_nested_attributes_for :recurring, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :origin
  validates_presence_of :destiny
  validates_presence_of :transport_type
  validates_presence_of :recurring

  validate :check_origin_and_destiny_address, :on => :create
  validates_length_of :participants, :minimum => 1, :allow_nil => false
  validates_length_of :participants, :maximum => 5, :if => :transport_type_car?

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

  def add_participant(participant)
    participants << Participant.new(:itinerary => self, :user => participant)
  end

  def self.visible_to(user)
    Itinerary.joins(:participants).where(:"participants.id" => user.id)
  end

private
  def check_origin_and_destiny_address
    errors.add(:origin, :invalid_address) unless origin_coordinates.present?
    errors.add(:destiny, :invalid_address) unless destiny_coordinates.present?
  end

end
