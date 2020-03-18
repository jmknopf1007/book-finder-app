Rails.application.routes.draw do
  
  resources :book_genres
  resources :reviews
  resources :genres
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :books

  post '/signup', to: "users#new", as: 'signup'
  get '/signup', to: "users#new"
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#verify'
  get '/logout', to: 'sessions#logout', as: 'logout'

  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
