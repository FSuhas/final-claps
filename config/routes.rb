Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations' }

  root to: "pages#home"

  resources :newsletters, only: [:create]

  get "role", to: "pages#role"

  resources :recruteurs, except: [:destroy]
  resources :candidats, except: [:destroy]

  resources :profils, except: %i[destroy new create]
  # post '/profils', to: 'profils#update'

  resources :jobs do
    resources :bookings, only: [:create, :update, :destroy]
  end
end
