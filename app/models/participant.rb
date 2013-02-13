class Participant < ActiveRecord::Base
  attr_accessible :user, :itinerary

  belongs_to :user
  belongs_to :itinerary

  has_enumeration_for :participation, :create_scopes => true, :create_helper => true

  validates_presence_of :user, :itinerary
  validates_uniqueness_of :user_id, :scope => :itinerary_id

  def method_missing(method, *args)
    if method =~ /user/
      method_name = method.to_s.gsub(/^user_/, '')
      user.send method_name.to_sym, *args
    end
  end

end
