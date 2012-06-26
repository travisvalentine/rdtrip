if Rails.env.production?
  ENV['LAST_FM_API_KEY']
else
  LAST_FM_API_KEY
end