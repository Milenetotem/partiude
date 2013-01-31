require 'spec_helper'

describe Recurring do

  context "associations" do
    it { should belong_to(:itinerary) }
    it { should have_enumeration_for(:repeat_in) }
  end

  context "validations" do
    it { should validate_presence_of(:repeat_in) }
    it { should validate_presence_of(:hour) }
    it { should validate_presence_of(:begin_day) }
  end

  context "#repeation_days" do
    it "return the days of week with true value" do
      options = {:sunday => true}
      recurring = Recurring.new(options)

      recurring.send(:repeation_days).should include(:sunday)
    end
  end

  context "#create" do
    context "repeat in week" do
      let(:recurring) do
        options = {:repeat_in => RepeatIn::WEEKLY, :hour => "00:00",
                 :begin_day => Date.today, :itinerary => Itinerary.new}

        recurring = Recurring.new(options)
        recurring.valid?
        recurring
      end
      it "need select at least one day select" do
        recurring.errors.keys.should include(:repeat_in)
      end

      it "and set interval when repeat_in is weekly" do
        message = I18n.t("activerecord.errors.messages.select_at_least_one_day".to_sym)
        recurring.errors[:repeat_in][0].should == message
      end

      it "save when one day is selected" do
        recurring.sunday = true
        expect{
          recurring.save!
        }.to change(Recurring, :count).by(1)
      end
    end

    context "repeat in month" do
      let! (:options) {
        {:repeat_in => RepeatIn::MONTHLY, :hour => "00:00", :begin_day => Date.today, :itinerary => Itinerary.new}
      }

      it "verify if there is one day selected" do
        recurring = Recurring.new(options)
        recurring.valid?
        recurring.errors.keys.should include(:repeat_in)
      end

      it "verify if there is more than one day selected" do
        recurring = Recurring.new(options)
        recurring.sunday = recurring.monday = true
        recurring.valid?
        recurring.should have(1).error_on(:repeat_in)
      end

      it "save when one day is selected" do
        recurring = Recurring.new(options)
        recurring.sunday = true
        expect{
          recurring.save!
        }.to change(Recurring, :count).by(1)
      end

    end

    it "save when everything is ok" do
      options = {:repeat_in => RepeatIn::TODAY, :hour => "00:00",
                 :begin_day => Date.today, :itinerary => Itinerary.new}

      recurring = Recurring.new(options)
      recurring.should be_valid
      expect{
        recurring.save!
      }.to change(Recurring, :count).by(1)
    end
  end

  context "#next_occur" do
    let(:monthly) {
      options = {}.tap do |option|
        option[:repeat_in] = RepeatIn::MONTHLY
        option[:hour] = "00:00"
        option[:begin_day] = Date.today
        option[:itinerary] = Itinerary.new
        option[:sunday] = true
      end
      Recurring.new(options)
    }

    it { should respond_to(:next_occur) }

    it "for today" do
      options = {:repeat_in => RepeatIn::TODAY, :hour => "00:00", :begin_day => Date.today, :itinerary => Itinerary.new}
      recurring = Recurring.new(options)
      recurring.next_occur.should == DateTime.now.beginning_of_day
    end

    context "for daily" do
      it "when it has not yet occurred" do
        hour = "#{Time.now + 1.hour}"
        recurring = Recurring.new({:repeat_in => RepeatIn::DAILY,
                                   :hour => hour, :begin_day => Date.tomorrow,
                                   :itinerary => Itinerary.new})
        expected_date = Time.parse("#{Date.tomorrow} #{hour}")
        recurring.next_occur.should == expected_date
      end

      it "when it is on the next day" do
        hour = "#{Time.now - 1.hour}"
        recurring = Recurring.new({:repeat_in => RepeatIn::DAILY,
                                   :hour => hour, :begin_day => Date.today,
                                   :itinerary => Itinerary.new})
        expected_date = Time.parse("#{Date.today + 1.day} #{hour}").to_time
        recurring.next_occur.should == expected_date
      end
    end

    it "for weekly" do
      hour = "#{Time.now.hour}:00"
      today = Date.today
      options = {}.tap do |option|
        option[:repeat_in] = RepeatIn::WEEKLY
        option[:hour] = hour
        option[:begin_day] = today
        option[:itinerary] = Itinerary.new
        option[:sunday] = today.sunday?
        option[:monday] = today.monday?
        option[:tuesday] = today.tuesday?
        option[:wednesday] = today.wednesday?
        option[:thursday] = today.thursday?
        option[:friday] = today.friday?
        option[:saturday] = today.saturday?
      end

      expected_date = DateTime.parse("#{Date.today + 7.day} #{hour}").to_time

      recurring = Recurring.new(options)
      recurring.next_occur.should == expected_date
    end

    it "for monthly" do
      hour = "#{Time.now.hour}:00"
      today = Date.today

      options = {}.tap do |option|
        option[:repeat_in] = RepeatIn::MONTHLY
        option[:hour] = hour
        option[:begin_day] = today
        option[:itinerary] = Itinerary.new
        option[:sunday] = today.sunday?
        option[:monday] = today.monday?
        option[:tuesday] = today.tuesday?
        option[:wednesday] = today.wednesday?
        option[:thursday] = today.thursday?
        option[:friday] = today.friday?
        option[:saturday] = today.saturday?
      end

      next_date = Date.today + 1.month
      if next_date.month == 2 && today.day > 28
        expected_date = DateTime.parse("#{Date.today + 2.month} #{hour}").to_time
      else
        expected_date = DateTime.parse("#{Date.today + 1.month} #{hour}").to_time
      end
      recurring = Recurring.new(options)
      recurring.next_occur.should == expected_date
    end

  end

end
