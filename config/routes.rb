Rails.application.routes.draw do
  resources :genres
  resources :lists
  resources :books
  resources :readers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
