require 'spec_helper'

describe Playlist do
	let!(:escape) { FactoryGirl.create(:escape) }
	let!(:metro) { FactoryGirl.create(:metro) }
	let!(:unique_song) { FactoryGirl.create(:unique_song, :metro_id => metro.id) }
	let!(:artist) { unique_song.artist }
	let!(:rdio_track) { FactoryGirl.create(:rdio_track) }
	let!(:rdio_track2) { FactoryGirl.create(:rdio_track) }
	let!(:track_list) { [rdio_track, rdio_track2] }
	let!(:playlist) { FactoryGirl.create(:playlist) }

  describe "validations" do
    it "is valid" do
      playlist.should be_valid
    end
  end

  describe ".build_from_artist(artist, escape)" do
  	it "tests" do
	  	recommender = double
	  	recommender.stub(:recommend_tracks_from_artist).and_return(track_list)
	  	pl = Playlist.build_from_artist(artist, escape, recommender)
	  	pl.rdio_tracks.should == track_list
	  end
  end

end