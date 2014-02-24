ConvenientRecipes::Application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "pages#index"

  resources :recipes
  resources :grocery_list_ingredients do
    collection do
      post '/create_multiple', to: "grocery_list_ingredients#create_multiple", as: :create_multiple
    end
  end
  
  get '/grocery_list', to: 'grocery_list_ingredients#index'
  get '/my_recipes', to: 'recipes#my_recipes'
  get '/favorite_recipes', to: 'recipes#favorite_recipes'

  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :users, only: :show
  resources :messages, only: [:new, :create]
  
end
