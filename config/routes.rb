Rails.application.routes.draw do
  # resources :notifications
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: :create
  end
  resources :users, only: :show
  get 'search', to:'posts#search'#для посика по сайту
  get 'tag', to: 'posts#index'# tag
  resources :notifications, only: :destroy
end
