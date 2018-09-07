Rails.application.routes.draw do

  root 'static#home'

  resources :users do
    resources :recipes, only: [:show, :index]
  end

  resources :ingredients
  resources :recipes

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'


end
