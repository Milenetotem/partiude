class Comment < ActiveRecord::Base
  attr_accessible :user, :itinerary, :content

  belongs_to :user
  belongs_to :itinerary

  validates_presence_of :user, :itinerary, :content
  validates_length_of :content, :minimum => 5, :maximum => 150

end
