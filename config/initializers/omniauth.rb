Rails.application.config.middleware.use OmniAuth::Builder do
    if Rails.env.production?
      provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
    else
      provider :linkedin, LINKEDIN_KEY, LINKEDIN_SECRET
    end
end