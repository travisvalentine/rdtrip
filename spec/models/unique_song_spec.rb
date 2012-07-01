require 'spec_helper'

describe UniqueSong do

	let(:unique_song){ FactoryGirl.create(:unique_song) }

  describe "validations" do
    it "is valid" do
      unique_song.should be_valid
    end
  end

end