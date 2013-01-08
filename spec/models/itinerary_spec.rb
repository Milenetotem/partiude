require 'spec_helper'

describe Itinerary do

  context "relations" do
    it{ should belong_to(:user) }
    it{ should have_many(:points) }
  end

  context 'validations' do
    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:origin) }
    it{ should validate_presence_of(:destiny) }
    it{ should validate_presence_of(:repeat_in) }
    it{ should validate_presence_of(:transport_type) }
    it{ should validate_presence_of(:day) }
    it{ should validate_presence_of(:hour) }
  end

end
