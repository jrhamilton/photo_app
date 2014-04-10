AlbumShare::Application.routes.draw do
root to: 'photos#index'
match('signup', {:via => :get, :to => 'users#new'})
match('login', {:via => :get, :to => 'sessions#new'})
match('logout', {:via => :get, :to => 'sessions#destroy'})
match('users/:id/tags', {:via => :get, :to => 'tags#show'})

  resources :users
  resources :albums
  resources :tags
  resources :sessions
  resources :photos
  resources :favorites
end
