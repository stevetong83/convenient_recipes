ConvenientRecipes::Application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "pages#index"

  resources :recipes
  resources :follows, only: [:create, :destroy]
  resources :favorites, only: :create
  resources :users, only: :show
  resources :messages, only: [:new, :create]
  
end
