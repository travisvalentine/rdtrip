require 'spec_helper'

describe Metro do
  let!(:metro) { FactoryGirl.create(:metro) }

  describe "#gmaps4rails_address" do
    it "should be a string of a metro name and city" do
      metro.gmaps4rails_address.should == "#{metro.name}, #{metro.country}"
    end
  end

  describe "#address" do
    it "should be a string of a metro name and country" do
      metro.address.should == "#{metro.name}, #{metro.country}"
    end
  end

end