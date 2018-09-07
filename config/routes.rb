Rails.application.routes.draw do

  root 'static#home'

  resources :users do
    resources :recipes, only: [:show, :index, :new]
  end

  get 'ingredients/most_used', to: 'ingredients#most_used'

  resources :ingredients, only: [:show, :index]
  resources :recipes

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'


end
