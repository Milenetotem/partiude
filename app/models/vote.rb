class Vote < ActiveRecord::Base

  attr_accessible :user, :approve, :poll

  belongs_to :poll
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :poll_id
  validates_presence_of :poll
  validates_presence_of :user

end
