Rails.application.routes.draw do
  resources :song_genres
  resources :reviews
  resources :genres
  resources :users
  resources :songs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
