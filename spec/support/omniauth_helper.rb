def set_omniauth(user)
  credentials = {:provider => :linkedin,
                 :uid      => user.uid,
                 :linkedin => {
                            :name => user.name,
                            :image => user.image
                          }
            }

  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uid],
    "info" => {
      "name" => user_hash[:name],
      "image" => user_hash[:image]
    }
  }
end

def set_invalid_omniauth(opts = {})
  
  credentials = { :provider => :linkedin,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)
  
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end 

def login(user = FactoryGirl.build(:user))
  set_omniauth(user)
  visit root_path
  find("#oauth_linkedin").click
  User.last
end

def logout
  visit root_path
  click_link "Logout"
end