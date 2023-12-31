Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :categories, except: %i[update destroy] do
    resources :expenses, only: %i[new create]
  end
end