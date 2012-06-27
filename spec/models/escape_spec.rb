require 'spec_helper'

describe Escape do

  let!(:escape)         { FactoryGirl.create(:escape, :expiration => (Time.now.to_date + 20),
                                              :longitude => -78.8527841,
                                              :latitude => 37.9069562) }
  let!(:expired_escape) { FactoryGirl.create(:escape, :expiration => (Time.now.to_date -  20) )}

  let!(:metro1)         { FactoryGirl.create(:metro, :latitude => 37.5407246,
                                                     :longitude => -77.4360481) }
  let!(:metro2)         { FactoryGirl.create(:metro, :latitude => 38.8951118,
                                                     :longitude => -77.0363658) }

  describe "validations" do
    it "is valid" do
      escape.should be_valid
    end
  end

  describe ".active" do

    it "shows escapes with expiration dates in the future" do
      Escape.active.should include(escape)
    end

    it "doesn't show escapes with expirations that have passed" do
      Escape.active.should_not include(expired_escape)
    end
  end

  describe ".search" do
    it "finds escapes that match search params"
  end

  describe "#find_nearest_metro" do
    it "finds the nearest last.fm metro to the escape lat/long" do
      escape.find_nearest_metro
      matched_metro = Metro.find_by_name(escape.nearest_metro)
      ((escape.latitude - matched_metro.latitude).abs).should be < ((escape.latitude - metro2.latitude).abs)
      ((escape.longitude - matched_metro.longitude).abs).should be < ((escape.longitude - metro2.longitude).abs)
    end
  end

  describe "#set_metro_value_as(metro)" do
    it "sets the escape's nearest_metro as the returned value from find_nearest_metro" do
      expect { escape.find_nearest_metro }.to change(escape, :nearest_metro)
    end
  end

  describe "#address" do
    it "is a string of an escape's latitude and longitude" do
      escape.address.should == "#{escape.latitude} #{escape.longitude}"
    end
  end

end