require 'spec_helper'

describe Comment do

  context "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:itinerary) }
  end

  context "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:itinerary) }
    it { should validate_presence_of(:content) }
    it { should ensure_length_of(:content).is_at_least(2) }
  end

end
