Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :jobs do
    resources :bookings, only: [:create, :update, :destroy]
  end
  resources :recruteurs, except: [:destroy]
  resources :candidats, except: [:destroy]

  get "role", to: "pages#role"

  resources :newsletters, only: [:create]

end
