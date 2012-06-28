desc "Get escapes"
task :get_popular_songs_for_metro => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  Metro.all.each do |metro|

    url = "http://ws.audioscrobbler.com/2.0/?method=geo.getmetrotrackchart&country=#{metro.country}&metro=#{metro.name}&api_key=8d19079968ad2b3850613fec62848790"

    doc = Nokogiri::HTML(open(URI.escape(url)))

    puts "Saving popular songs from #{metro.name}, #{metro.country}...\n ----------------------"

    doc.xpath('//toptracks/track').each do |track|
      song_title, song_lastfm_url, song_artist = track.xpath('./name','./url','./artist/name').map{|x| x.text.strip}
      db_pop_song           = PopularSong.new
      db_pop_song.title     = song_title
      db_pop_song.artist    = song_artist
      db_pop_song.url       = song_lastfm_url + "?autoplay"
      db_pop_song.metro_id  = metro.id
      db_pop_song.save
    end

  end

end