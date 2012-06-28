Roadtrip::Application.routes.draw do

  get "lastfm_authentications/create"

  get "sessions/create"

  get "sessions/destroy"

  root :to => "sessions#new"

  resources :songs, :only => :index
  resources :escapes, :only => [:index, :show]
  resources :lastfm_session_keys, :only => [:new, :create]

  match "lastfm", :to => "lastfm_session_keys#new", :as => "lastfm"

  match "auth/linkedin/callback", :to => "sessions#create"
  match "auth/lastfm/callback", :to => "lastfm_session_keys#create"

  match "logout", :to => "sessions#destroy", :as => "logout"
  get '/escapes_lat_long', to: "escapes#escapes_lat_long"
end
