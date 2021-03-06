require 'spec_helper'

describe Itinerary do

  subject do
    Itinerary.new
  end

  before(:all) do
    Geocoder::Lookup::Test.add_stub(
        "Porto Alegre, RS", [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => 'Porto Alegre, RS, Brasil',
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
  end

  context "relations" do
    it{ should have_many(:points) }
    it{ should have_many(:participants) }
    it{ should have_many(:comments) }
    it{ should have_one(:recurring) }
    it{ should have_enumeration_for(:state) }
    it{ should have_enumeration_for(:transport_type) }
    it{ should respond_to(:add_participant) }
  end

  context 'validations' do
    let!(:itinerary) do
      recurring = Recurring.new(:repeat_in => RepeatIn::TODAY,
                                :hour => "00:00",
                                :begin_day => Date.today)
      itinerary_hash = {:name => "Trajeto de teste",
                        :origin => "Porto Alegre, RS",
                        :destiny => "Porto Alegre, RS",
                        :recurring => recurring,
                        :transport_type => TransportType::BIKE}
      Itinerary.new(itinerary_hash)
    end

    let(:participant) { User.new(:email => "lero@partiu.de") }

    before(:each) do
      itinerary.participants = Array.new
    end

    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:origin) }
    it{ should validate_presence_of(:destiny) }
    it{ should validate_presence_of(:transport_type) }
    it{ should validate_presence_of(:recurring) }

    it "with one there is no errors" do
      itinerary.add_participant(participant)
      itinerary.valid?
      itinerary.errors.messages.should have(0).items
    end

    it "add an error when there is no participants" do
      itinerary.valid?
      itinerary.should have(1).errors_on(:participants)
    end

    context "when itinierary is by car" do

      before :each do
        itinerary.participants = Array.new
        itinerary.transport_type = TransportType::CAR
        itinerary.add_participant(participant)
        itinerary.add_participant(User.new(:email => "part2@partiu.de"))
        itinerary.add_participant(User.new(:email => "part3@partiu.de"))
        itinerary.add_participant(User.new(:email => "part4@partiu.de"))
        itinerary.add_participant(User.new(:email => "part5@partiu.de"))
      end

      it "must have one driver" do
        itinerary.valid?
        itinerary.errors.messages.should have(1).items
      end

      it "can have at most five participants" do
        itinerary.add_participant(User.new(:email => "part6@partiu.de"))
        itinerary.valid?
        itinerary.errors.messages.should have(1).items
      end
    end

  end

  context "#add_participant" do
    let(:itinerary) { Fabricate(:itinerary_bike) }
    let(:user) { Fabricate(:user) }
    it "increase participants count when add a new one" do
      expect {
        itinerary.add_participant(user)
      }.to change(Participant, :count).by(2) # Fabricate(:itinerary_bike) creates a initial participant
    end

    it "throw and exception when participant already exists" do
      itinerary.add_participant(user)
      expect {
        itinerary.add_participant(user)
        itinerary.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "#already_participating?(user)" do
    let(:itinerary) { Fabricate(:itinerary_bike) }
    let(:user) { Fabricate(:user) }
    let(:another_user) { Fabricate(:user) }
    before do
      itinerary.add_participant(user)
    end

    it "returns true when user is already participanting" do
      itinerary.already_participating?(user).should be_true
    end

    it "returns false when user is already participanting" do
      itinerary.already_participating?(another_user).should be_false
    end
  end

  context "has_pending_poll_for?(user)" do
    let(:itinerary) { Fabricate(:itinerary_bike) }
    let(:user) { Fabricate(:user) }
    let(:another_user) { Fabricate(:user) }

    before(:each) do
      Fabricate(:poll, :requestor => user, :itinerary => itinerary)
    end

    it "return true when user has a pending poll" do
      itinerary.has_pending_poll_for?(user).should be_true
    end

    it "return false when user has not a pending poll" do
      itinerary.has_pending_poll_for?(another_user).should be_false
    end
  end

end
