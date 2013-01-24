class Recurring < ActiveRecord::Base
  attr_accessible :repeat_in, :hour, :begin_day, :itinerary

  belongs_to :itinerary

  has_enumeration_for :repeat_in, :create_helpers => {:prefix => true}

  validates_presence_of :repeat_in
  validates_presence_of :hour
  validates_presence_of :begin_day
  validates_presence_of :itinerary

  validate :check_weekly_selected_days

private
  def check_weekly_selected_days
    if repeat_in_weekly? && !selected_any_day?
      errors.add(:repeat_in, :select_at_least_one_day)
    end
  end

  def selected_any_day?
    sunday || monday || tuesday || wednesday || thursday || friday || saturday
  end

end
