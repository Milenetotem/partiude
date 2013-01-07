require 'spec_helper'

describe Route do

  it { should belong_to(:user) }
  it { should have_many(:points) }

end
