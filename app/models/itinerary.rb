class Itinerary < ActiveRecord::Base

  attr_accessible :name, :transport_type, :origin, :destiny,
                  :day, :hour, :repeat_in, :user, :recurring,
                  :participants, :recurring_attributes

  has_many :points
  has_many :participants
  has_many :users, :through => :participants
  has_many :comments

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

  def add_participant(participant)
    participants << Participant.new(:itinerary => self, :user => participant)
  end

  def prepare
    build_recurring # unless recurring.present?
  end

  def self.search(params)
    puts params
    itineraries = Itinerary.active
    itineraries = itineraries.where("upper(name) like ?", "%#{params[:name].upcase}%") if params[:name].present?
    itineraries = itineraries.where("upper(origin) like ?", "%#{params[:origin].upcase}%") if params[:origin].present?
    itineraries = itineraries.where("upper(destiny) like ?", "%#{params[:destiny].upcase}%") if params[:destiny].present?
    itineraries = itineraries.where(:transport_type => params[:transport_type]) if params[:transport_type].present?

    if params[:recurring].present?
      recurring = params[:recurring]
      itineraries = itineraries.joins(:recurring)
      itineraries = itineraries.where("recurrings.repeat_in = ?", recurring[:repeat_in]) if recurring[:repeat_in].present?
      itineraries = itineraries.where("recurrings.hour = ?", recurring[:hour]) if recurring[:hour].present?
      itineraries = itineraries.where("recurrings.begin_day = ?", recurring[:begin_day]) if recurring[:begin_day].present?
      itineraries = itineraries.where("recurrings.sunday = ?", recurring[:sunday]) if recurring[:sunday].present? && recurring[:sunday] == 1
      itineraries = itineraries.where("recurrings.monday = ?", recurring[:monday]) if recurring[:monday].present? && recurring[:monday] == 1
      itineraries = itineraries.where("recurrings.tuesday = ?", recurring[:tuesday]) if recurring[:tuesday].present? && recurring[:tuesday] == 1
      itineraries = itineraries.where("recurrings.wednesday = ?", recurring[:wednesday]) if recurring[:wednesday].present? && recurring[:wednesday] == 1
      itineraries = itineraries.where("recurrings.thursday = ?", recurring[:thursday]) if recurring[:thursday].present? && recurring[:thursday] == 1
      itineraries = itineraries.where("recurrings.friday = ?", recurring[:friday]) if recurring[:friday].present? && recurring[:friday] == 1
      itineraries = itineraries.where("recurrings.saturday = ?", recurring[:saturday]) if recurring[:saturday].present? && recurring[:saturday] == 1
    end

    itineraries
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
