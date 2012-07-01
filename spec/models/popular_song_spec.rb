require 'spec_helper'

describe PopularSong do

	let(:popular_song){ FactoryGirl.create(:popular_song) }

  describe "validations" do
    it "is valid" do
      popular_song.should be_valid
    end
  end

end