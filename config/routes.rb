AlbumShare::Application.routes.draw do

match('signup', {:via => :get, :to => 'users#new'})
match('login', {:via => :get, :to => 'sessions#new'})
match('logout', {:via => :get, :to => 'sessions#destroy'})

  resources :users
  resources :albums
  resources :tags
  resources :sessions
  resources :photos
end
