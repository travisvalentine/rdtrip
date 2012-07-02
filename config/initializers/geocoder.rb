if Rails.env.production?
	Geocoder::Configuration.lookup = :yahoo
	Geocoder::Configuration.timeout = 8
end