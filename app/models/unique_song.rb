class UniqueSong < ActiveRecord::Base
  belongs_to :metro

  # def self.make_playlist_from(song, user_id)
  # 	user = User.find(user_id)

  # 	artist = song.artist
  # 	artist_escaped = artist.gsub(" ","%20")


  # 	sig_string = "api_key#{LAST_FM_API_KEY}" +
  # 							 "methodradio.tune" +
  # 							 "sk#{user.lastfm_session_key.token}" +
  # 							 "stationlastfm://artist/#{artist_escaped}/similarartists"

  # 	encoded_sig_string = sig_string

  # 	api_sig = Digest::MD5.hexdigest(encoded_sig_string + "#{LAST_FM_SECRET_KEY}")

  # 	raise api_sig.inspect

  # 	conn = Faraday.new(:url => 'http://ws.audioscrobbler.com/2.0/') do |faraday|
  # 	  faraday.request  :url_encoded
  # 	  faraday.response :logger
  # 	  faraday.adapter  Faraday.default_adapter
  # 	end

  # 	con.post do |c|
  # 		c.body = '{
  # 			"api_key": "#{LAST_FM_API_KEY}"
  # 			"api_sig": sig_string
		# 		"method=radio.tune"
		# 		"sk": "#{user.lastfm_session_key.token}"
		# 		"station": "lastfm%3A%2F%2Fartist%2F#{artist_escaped}%2Fsimilarartists"
  # 		}'
  # 	end
  # end

end
