require 'spec_helper'

describe Itinerary do

  context "relations" do
    it{ should have_many(:points) }
    it{ should have_many(:participants) }
    it{ should have_one(:recurring) }
    it{ should have_enumeration_for(:state) }
    it{ should have_enumeration_for(:transport_type) }
  end

  context 'validations' do
    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:origin) }
    it{ should validate_presence_of(:destiny) }
    it{ should validate_presence_of(:transport_type) }
    it{ should validate_presence_of(:recurring) }
  end

  context "#add_participant" do
    let(:recurring) {
      Recurring.new(:repeat_in => RepeatIn::TODAY,
                    :hour => "00:00",
                    :begin_day => Date.today)
    }
    let(:itinerary) do
      itinerary_hash = {:name => "Trajeto de teste",
                        :origin => "Rua dos Andradas 100",
                        :destiny => "Rua dos Andradas 1000",
                        :recurring => recurring,
                        :transport_type => TransportType::BIKE}
      itinerary = Itinerary.new(itinerary_hash)
    end

    it "with one there is no errors" do
      itinerary.add_participant(User.new(:email => "lero@partiu.de"))
      itinerary.valid?
      itinerary.errors.messages.should have(0).items
    end

    it "add an error when there is no participants" do
      itinerary.valid?
      itinerary.should have(1).errors_on(:participants)
    end
  end

end
