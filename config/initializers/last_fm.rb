if Rails.env.production?
  ENV['LAST_FM_API_KEY']
  ENV['LAST_FM_SECRET_KEY']
else
  LAST_FM_API_KEY
  LAST_FM_SECRET_KEY
end