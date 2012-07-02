require 'spec_helper'

describe "Recommender" do

  let(:client) { Nestling.new("123") }

  let(:artist) { "Notorious BIG" }

  let(:nestling_response) { 
    [{:foreign_ids=>[{"catalog"=>"rdio-us-streaming", 
    "foreign_id"=>"rdio-us-streaming:song:t123456"}], 
    :artist_id=>"AJFOE813981ALJKL",
    :id=>"OIWJF13890JOWI", 
    :artist_name=>"Notorious BIG", 
    :title=>"Juicy"}] }

  context "recommending a tracklist from artists" do
    
    before(:each) do
      Nestling::Playlist.any_instance.stub(:static).and_return(nestling_response)
    end

    it "returns a collection of tracks with populated values" do
      rec = Recommender.recommend_tracks_from_artist(artist, client)
      rec.each do |track|
        track.class.should be RdioTrack
        track.artist.should_not be nil
        track.title.should_not be nil
        track.rdio_id.should_not be nil
      end
    end

  end
end