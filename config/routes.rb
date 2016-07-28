Rails.application.routes.draw do
  root to: 'home#index'
  resources :cart_items, only: [:create, :update, :destroy]
  resources :cart, only: [:index]
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:title', to: 'categories#show', as: :category
end
