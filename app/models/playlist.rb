class Playlist < ActiveRecord::Base
  has_many :rdio_tracks
  belongs_to :escape

  def self.build_from_artist(artist, escape, recommender=Recommender)
    playlist = Playlist.find_or_create_by_escape_id(escape.id)
    playlist.rdio_tracks += recommender.recommend_tracks_from_artist(artist)
    playlist.save
    playlist
  end

end