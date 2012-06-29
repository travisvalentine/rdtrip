if Rails.env.production?
	Geocoder::Configuration.lookup = :yahoo
end