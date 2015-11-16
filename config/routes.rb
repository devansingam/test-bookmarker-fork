Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :bookmarks, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
  root 'static#index'
end
