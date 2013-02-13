require 'spec_helper'

describe Poll do

  context "relations" do
    it { should belong_to(:requestor) }
    it { should belong_to(:itinerary) }
    it { should have_many(:votes) }
  end

  context "validations" do
    it { should validate_presence_of(:requestor) }
    it { should validate_presence_of(:itinerary) }
  end

  context "respond_to" do
    it { should respond_to(:vote) }
    it { should respond_to(:approved?) }
    it { should respond_to(:rejected?) }
  end

  context "results" do
    let(:poll) { Fabricate(:poll) }
    let(:itinerary) { poll.itinerary }
    let(:user) { Fabricate(:user) }
    let(:another_user) { Fabricate(:user) }
    before(:each) do
      itinerary.add_participant(user)
      itinerary.add_participant(another_user)
    end
    it "user is approved whern 50% + 1 say yes" do
      itinerary.participants.each do |part|
        poll.vote(part.user, true)
      end

      poll.should be_approved
    end

    it "user is rejected whern 50% + 1 say no" do
      itinerary.participants.each do |part|
        poll.vote(part.user, false)
      end
      poll.should be_rejected
    end
  end

end
