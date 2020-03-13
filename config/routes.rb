Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#new', as: 'posts'
  post 'posts', to: 'posts#create'
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new', as: 'users'
  post 'login', to: 'sessions#create'
  get 'show', to: 'sessions#show', as: 'show'
  delete 'singout', to: 'sessions#destroy'
end
