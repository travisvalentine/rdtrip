class Playlist < ActiveRecord::Base
	has_many :rdio_tracks
  belongs_to :escape

	def self.build_from_artist(artist, escape)
    playlist = Playlist.find_or_create_by_escape_id(escape.id)
    playlist.rdio_tracks += Recommender.recommend_tracks_from_artist(artist)
    playlist.save
    playlist
  end

  # def remove_track_by_rdio(rdio_id)
  #   track = find_track_by_rdio(rdio_id)
  #   unless track.nil?
  #     tracks.delete(track)
  #     save
  #   end
  # end

  # def find_track_by_rdio(rdio_id)
  #   tracks.find { |t| t.rdio_id == rdio_id }
  # end
end