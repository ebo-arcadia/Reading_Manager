Rails.application.routes.draw do

  root 'sessions/welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :genres
  resources :lists
  resources :books
  resources :readers
end
