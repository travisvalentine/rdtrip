Roadtrip::Application.routes.draw do

  get "lastfm_authentications/create"

  get "sessions/create"

  get "sessions/destroy"

  root :to => "info#home"

  resources :songs, :only => :index
  resources :escapes, :only => [:index, :show]

  match "auth/linkedin/callback", :to => "sessions#create"
  match "auth/lastfm/callback", :to => "lastfm_session_keys#create"

  match "logout", :to => "sessions#destroy", :as => "logout"

end
