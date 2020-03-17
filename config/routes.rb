Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#new', as: 'posts'
  post 'posts', to: 'posts#create'
  get 'posts/index'
  get 'login', to: 'sessions#new', as: 'users'
  post 'login', to: 'sessions#create'
  delete 'singout', to: 'sessions#destroy'
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
end
