require 'spec_helper'

describe Vote do

  context "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:poll) }
  end

  context "validations" do
    before() do
      Fabricate(:vote)
    end
    it { should validate_presence_of(:poll) }
    it { should validate_presence_of(:user) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:poll_id) }
  end

end
