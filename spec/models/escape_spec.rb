require 'spec_helper'

describe Escape do

  let!(:escape)         { FactoryGirl.create(:escape, :expiration => (Time.now.to_date + 20),
                                              :longitude => -78.8527841,
                                              :latitude => 37.9069562,
                                              :upvotes => 40,
                                              :downvotes => 4) }

  let!(:expired_escape) { FactoryGirl.create(:escape, :expiration => (Time.now.to_date -  20),
                                                      :upvotes => 4,
                                                      :downvotes => 30) }

  let!(:escape_city)    { FactoryGirl.create(:escape, :city => "Cabo San Lucas",
                                                      :upvotes => 4,
                                                      :downvotes => 2) }

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

  describe "#city_escaped" do
    it "formats cities with spaces and hyphens with underscores" do
      escape_city.city_escaped.should == "Cabo_San_Lucas"
    end
  end

  describe "#votes" do
    it "calculates the difference in upvotes and downvotes for an escape" do
      escape_city.votes.should == 2
    end

    it "defaults to 1 if the difference is less than or equal to 1" do
      expired_escape.votes.should == 1
    end

    it "defaults to 20 if the difference is greater than or equal to 20" do
      escape.votes.should == 20
    end
  end

  describe "#add_vote" do
    it "adds 1 to an instance's upvotes attribute" do
      expect{escape.add_vote}.to change{escape.upvotes}.by(1)
    end
  end

  describe "#add_downvote" do
    it "adds 1 to an instance's downvotes attribute" do
      expect{escape.add_downvote}.to change{escape.downvotes}.by(1)
    end
  end

end