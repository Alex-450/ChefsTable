Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chef_profiles do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]
  patch 'bookings/:id', to: "bookings#update"
end
