Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :foods
  resources :recipes
  resources :recipe_foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
