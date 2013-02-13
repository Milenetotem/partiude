require 'spec_helper'

describe Comment do

  it { should belong_to :user }
  it { should belong_to :itinerary }

  it { should validate_presence_of :user }
  it { should validate_presence_of :itinerary }
  it { should validate_presence_of :content }

  it { should ensure_length_of(:content).is_at_most(150) }
  it { should ensure_length_of(:content).is_at_least(5) }

end
