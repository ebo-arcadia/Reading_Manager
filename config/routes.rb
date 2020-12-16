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

  # nested routes

  # '/readers/:id/lists'
  # shallow routing nesting only what is necessary
  # in this case, reader_id is important
  resources :readers do
    resources :lists, shallow: true

  end 

  # '/lists/:id/books'
  resources :lists do
    resources :books
  end 

  # '/readers/:id/books'

end
