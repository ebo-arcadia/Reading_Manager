Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get 'signup', to: 'reader#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  resources :genres
  resources :lists
  resources :books
  resources :readers

end
