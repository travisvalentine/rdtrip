Roadtrip::Application.routes.draw do

  get "sessions/create"

  get "sessions/destroy"

  root :to => "info#home"

  resources :songs, :only => :index
  resources :escapes, :only => :index

  match "auth/linkedin/callback", :to => "sessions#create"
  match "logout", :to => "sessions#destroy", :as => "logout"

end
