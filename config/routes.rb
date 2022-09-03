Rails.application.routes.draw do
  resources :teams
  resources :games
  resources :seasons
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rails/welcome#index"
end
