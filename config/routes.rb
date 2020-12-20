Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/signup', to: 'readers#new'
  post '/signup', to: 'readers#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  # Omniauth log in route with Google 
  get '/auth/:provider/callback', to: 'sessions#google'
  
  # resources :readers
  # resources :lists

  # nested routes

   # '/lists/:id/books'
  resources :lists do
    resources :books
  end 
  resources :books
  # '/readers/:id/lists'
  # shallow routing nesting only what is necessary
  # in this case, reader_id is important
  # because list is expected to be created for a particular reader
  resources :readers do
    resources :lists, only: [:create, :index, :delete]
  end 

  resources :genres, only: [:index, :show]

  # '/readers/:id/books'

end
