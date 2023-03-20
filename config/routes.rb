# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  resources :articles, only: [:index]
  put '/article/:id/like', to: 'articles#like', as: 'like'
  put '/article/:id/user_like', to: 'articles#user_like', as: 'user_like'

  resources :users, except: [:new]
  get 'signup', to: 'users#new'
  get '/user/:id/liked', to: 'users#liked', as: 'liked'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
