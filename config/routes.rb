Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chef_profiles do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [] do
    resources :reviews, only: [:create, :new]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:index, :show]
end
