Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/article', to:'static_pages#article'
  get  '/all_article', to: 'static_pages#all_article'
  get  '/signup', to: 'users#new'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  resources :users
  resources :posts
  resources :questions
end
