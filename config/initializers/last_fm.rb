if Rails.env.production?
  LAST_FM_API_KEY=ENV['LAST_FM_API_KEY']
else
  LAST_FM_API_KEY
end