Rails.application.routes.draw do
  devise_for :users
  mount MaintenanceTasks::Engine => "/maintenance_tasks"
  resources :teams
  resources :games
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
