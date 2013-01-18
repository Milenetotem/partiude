require 'spec_helper'

describe Participant do

  it { should belong_to(:user) }
  it { should belong_to(:itinerary) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:itinerary) }

end
