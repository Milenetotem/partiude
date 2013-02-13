require 'spec_helper'

describe Participant do

  it { should belong_to(:user) }
  it { should belong_to(:itinerary) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:itinerary) }

  it { should respond_to(:driver?) }

  context "validate uniqueness" do
    before() do
      Fabricate(:itinerary_bike)
    end
    it { should validate_uniqueness_of(:user_id).scoped_to(:itinerary_id)}
  end

end
