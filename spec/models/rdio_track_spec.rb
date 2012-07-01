require 'spec_helper'

describe RdioTrack do

	let(:rdio_track) { FactoryGirl.create(:rdio_track) }

  describe "validations" do
    it "is valid" do
      rdio_track.should be_valid
    end
  end

end
