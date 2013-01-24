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
    it { should validate_presence_of(:itinerary) }
  end

  context "#create" do
    context "with invalid itinerary" do
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
    end

    it "save when everything is ok" do
      options = {:repeat_in => RepeatIn::TODAY, :hour => "00:00",
                 :begin_day => Date.today, :itinerary => Itinerary.new}

      recurring = Recurring.new(options)
      recurring.should be_valid
    end
  end

end
