Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get 'signup', to: 'readers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  
  resources :genres
  resources :lists
  resources :books
  resources :readers

end
