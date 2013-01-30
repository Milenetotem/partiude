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
    let(:today) {}
    let(:daily) {}
    let(:weekly) {}
    let(:monthly) {}

    it { should respond_to(:next_occur) }

  end

end
