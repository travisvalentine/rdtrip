Roadtrip::Application.routes.draw do

  get "info/shoutouts"

  get "sessions/create"

  get "sessions/destroy"

  root :to => "sessions#new"

  match "shout-outs", :to => "info#shoutouts", :as => "shoutouts"

  resources :songs, :only => :index
  resources :escapes, :only => [:index, :show]

  match "auth/linkedin/callback", :to => "sessions#create"

  match "logout", :to => "sessions#destroy", :as => "logout"

  get '/escapes_lat_long', to: "escapes#escapes_lat_long"
end
