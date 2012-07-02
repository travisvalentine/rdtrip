require 'nestling'

class Recommender < ActiveRecord::Base

  def self.recommend_tracks_from_artist(artist=artist, client=Nestling.new)
    playlist_rec = client.playlist.static(
      artist: artist,
      bucket: "id:rdio-us-streaming",
      type: "artist-radio",
      limit: true
     )
    parse_response(playlist_rec)
  end

  def self.parse_response(rec)
    rdio_tracks = []
    rec.each do |track|
      track = RdioTrack.new(
        artist: track[:artist_name],
        title: track[:title],
        rdio_id: track[:foreign_ids].first["foreign_id"].split(":").last
        )
      rdio_tracks << track
    end
    rdio_tracks
  end
end