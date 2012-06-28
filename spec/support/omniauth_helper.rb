def set_omniauth(user)
  credentials = {:provider => :linkedin,
                 :uid      => user.uid,
                 :info => {
                            :name => user.name,
                            :image => user.image
                          }
            }

  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "info" => {
      "name" => user_hash[:name],
      "image" => user_hash[:image]
    },
    "credentials" => { "token" => user.access_token },
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
  find("a#oauth_linkedin img").click
  User.last
end

def logout
  visit root_path
  click_link "Logout"
end