Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  resources :users
  resources :posts
  resources :questions
end
