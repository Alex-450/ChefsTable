Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :chef_profiles do
    resources :bookings, only: [:index, :new, :create]
  end
end
