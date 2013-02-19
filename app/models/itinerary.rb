class Itinerary < ActiveRecord::Base

  attr_accessible :name, :transport_type, :origin, :destiny,
                  :day, :hour, :repeat_in, :user, :recurring,
                  :participants, :recurring_attributes

  has_many :points
  has_many :participants
  has_many :users, :through => :participants
  has_many :comments
  has_many :polls
  has_many :requestors, :through => :polls

  has_one :recurring, :dependent => :destroy

  has_enumeration_for :transport_type, :create_scopes => true, :create_helpers => {:prefix => true}
  has_enumeration_for :state, :create_scopes => true, :create_helpers => true

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

  validate :check_driver, :if => :transport_type_car?

  def origin_coordinates
    coordinations_for(origin) if origin.present?
  end

  def destiny_coordinates
    coordinations_for(origin) if destiny.present?
  end

  def add_participant(user)
    participants << Participant.new(:itinerary => self, :user => user)
  end

  def prepare
    build_recurring unless recurring.present?
  end

  def already_participating?(user)
    users.include? user
  end

  def has_pending_poll_for?(user)
    Poll.active.where(:requestor_id => user.id, :itinerary_id => self.id).size > 0
  end

  def self.visible_to(user)
    Itinerary.joins(:participants).where(:"participants.user_id" => user.id)
  end

private
  def check_origin_and_destiny_address
    errors.add(:origin, :invalid_address) unless origin_coordinates.present?
    errors.add(:destiny, :invalid_address) unless destiny_coordinates.present?
  end

  def coordinations_for(address)
    coordination = Geocoder.search(address)[0]
    [coordination.latitude, coordination.longitude] if coordination.present?
  end

  def check_driver
    if participants.size >= 5 && !has_a_driver?
      errors.add(:participants, :need_a_driver)
    end
  end

  def has_a_driver?
    participants.select do |participant|
      participant.driver?
    end.size > 0
  end

end
