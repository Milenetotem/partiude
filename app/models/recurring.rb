require 'recurrence'

class Recurring < ActiveRecord::Base
  attr_accessible :repeat_weekly_interval, :repeat_in, :hour, :begin_day, :itinerary,
                  :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday

  belongs_to :itinerary

  has_enumeration_for :repeat_in, :create_helpers => {:prefix => true}

  validates_presence_of :repeat_in
  validates_presence_of :hour
  validates_presence_of :begin_day
  validate :check_weekly_selected_days, :check_monthly_selected_days

  def next_occur
    return hour if RepeatIn::TODAY

    case repeat_in
    when RepeatIn::DAILY
      options = {:every => :day, :start => start, :interval => 24}
    when RepeatIn::WEEKLY
      options = {:every => :week, :start => start, :on => repeation_days}
    when RepeatIn::MONTHLY
      options = {:every => :month, :start => start, :on => repeation_days}
    end
    Recurrence.new(options).next
  end

private
  def check_weekly_selected_days
    if repeat_in_weekly? && repeation_days.size < 1
      errors.add(:repeat_in, :select_at_least_one_day)
    end
  end

  def check_monthly_selected_days
    if repeat_in_monthly? && repeation_days.size != 1
      errors.add(:repeat_in, :select_only_one_day)
    end
  end

  def start
    DateTime.parse("#{begin_day.to_date} #{hour}")
  end

  def repeation_days
    DaysOfWeek.list.select do |day|
      day.to_sym if send day.to_sym
    end
  end

end
