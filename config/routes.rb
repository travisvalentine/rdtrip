Roadtrip::Application.routes.draw do

  get "playlists/new"

  get "playlists/show"

  get "playlists/create"

  get "tracks/show"

  get "sessions/create"

  get "sessions/destroy"

  root :to => "sessions#new"

  resources :songs, :only => :index
  resources :escapes, :only => [:index, :show]

  match "auth/linkedin/callback", :to => "sessions#create"

  match "logout", :to => "sessions#destroy", :as => "logout"

  get '/escapes_lat_long', to: "escapes#escapes_lat_long"
end
