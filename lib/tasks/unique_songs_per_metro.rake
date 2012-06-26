desc "Get escapes"
task :get_unique_songs_for_metro => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  Metro.all.each do |metro|
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getmetrouniquetrackchart&country=#{metro.country}&metro=#{metro.name}&api_key=#{LAST_FM_API_KEY}"
    doc = Nokogiri::HTML(open(URI.escape(url)))

    puts "Saving unique songs from #{metro.name}, #{metro.country}...\n ----------------------"

    doc.xpath('//toptracks/track').each do |track|
      song_title, song_lastfm_url, song_artist = track.xpath('./name','./url','./artist/name').map{|x| x.text.strip}
      db_unique_song          = UniqueSong.new
      db_unique_song.title    = song_title
      db_unique_song.artist   = song_artist
      db_unique_song.url      = song_lastfm_url
      db_unique_song.metro_id = metro.id
      db_unique_song.save
    end

  end

end