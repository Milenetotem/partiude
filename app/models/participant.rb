class Participant < ActiveRecord::Base
  attr_accessible :user, :itinerary

  belongs_to :user
  belongs_to :itinerary

  validates_presence_of :user, :itinerary

end
