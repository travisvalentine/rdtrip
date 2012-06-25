desc "Get last.fm metros"
task :get_metros => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  # return all metropolitan areas on last.fm
  url = "http://ws.audioscrobbler.com/2.0/?method=geo.getmetros&api_key=8d19079968ad2b3850613fec62848790"

  doc = Nokogiri::HTML(open(URI.escape(url)))

  doc.xpath('//metros/metro').each do |metro|
    metro_name, metro_country = metro.xpath('./name','./country',).map{|x| x.text.strip}
    db_metro = Metro.find_or_initialize_by_name(metro_name)
    puts "Adding metro for #{metro_name}"
    db_metro.name_formatted = metro_name.split.join("%20")
    db_metro.country = metro_country
    db_metro.country_formatted = metro_country.split.join("%20")
    db_metro.save
  end
end