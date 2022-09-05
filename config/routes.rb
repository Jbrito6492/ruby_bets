Rails.application.routes.draw do
  mount MaintenanceTasks::Engine => "/maintenance_tasks"
  resources :games
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#index"
end
