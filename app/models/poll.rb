class Poll < ActiveRecord::Base

  attr_accessible :requestor, :itinerary
  has_many :votes

  belongs_to :requestor, :class_name => "User", :foreign_key => "requestor_id"
  belongs_to :itinerary

  validates_presence_of :requestor
  validates_presence_of :itinerary

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

end
