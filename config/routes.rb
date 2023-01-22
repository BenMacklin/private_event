Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :attendances
  devise_for :users
  get '/users/:id', :to => 'users#show', :as => :user
  # Defines the root path route ("/")
  root "events#index"
end
