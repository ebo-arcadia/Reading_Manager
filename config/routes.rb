Rails.application.routes.draw do
  resources :genres
  resources :lists
  resources :books
  resources :readers
end
