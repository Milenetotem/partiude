class Poll < ActiveRecord::Base

  attr_accessible :requestor, :itinerary, :origin, :destiny, :itinerary_id
  has_many :votes

  belongs_to :requestor, :class_name => "User", :foreign_key => "requestor_id"
  belongs_to :itinerary

  has_enumeration_for :state, :create_scopes => true, :create_helpers => true

  validates_presence_of :requestor
  validates_presence_of :itinerary
  validates_presence_of :origin
  validates_presence_of :destiny

  def approved?
    approval_factor = votes.select(&:approve).size
    participants = (itinerary.participants.size + 1)
    result = (approval_factor.to_f / participants.to_f)
    result >= 0.5
  end

  def rejected?
    rejection_factor = votes.select { |vote| !vote.approve }.size
    participants = (itinerary.participants.size + 1)
    result = (rejection_factor.to_f / participants.to_f)
    result >= 0.5
  end

  def vote(user, approved)
    Vote.create(:poll => self, :user => user, :approve => approved)
  end

  def self.for(itinerary, user)
    votes = Vote.joins(:poll)
    votes = votes.where("votes.user_id != ?", user.id)
    votes = votes.where("polls.requestor_id != ?", user.id)
    votes = votes.where("polls.itinerary_id = ?", itinerary.id)
    votes.collect(&:poll)
  end

end
