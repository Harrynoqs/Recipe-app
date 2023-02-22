Rails.application.routes.draw do
  devise_for :add_devise_to_users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "users#index"

  resources :users, only: [:index, :show]
end
