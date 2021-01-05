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

  # nested routes

  # '/lists/:id/books'
  resources :lists do
    resources :books
  end 
  resources :books

  # '/readers/:id/lists'
  # using shallow routing nesting only what is necessary
  # in this case, reader_id is important
  # because list is expected to be created by a particular reader
  # new action is not used as a reader should not create list for other readers
  resources :readers do
    resources :lists, only: [:index]
  end 

  resources :genres, only: [:index, :show]

end
