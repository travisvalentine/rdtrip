require 'spec_helper'

describe Metro do
  let!(:metro) { FactoryGirl.create(:metro) }

  describe "validations" do
    it "is valid" do
      metro.should be_valid
    end
  end

  describe "#address" do
    it "should be a string of a metro name and country" do
      metro.address.should == "#{metro.name}, #{metro.country}"
    end
  end

end