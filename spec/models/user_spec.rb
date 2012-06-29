require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  describe "validations" do
    it "is valid" do
      user.should be_valid
    end
  end

end