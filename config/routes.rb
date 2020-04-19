Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  post  '/static_pages/guest_sign_in', to: 'static_pages#new_guest'
  delete  '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :questions
  resources :profiles
end
