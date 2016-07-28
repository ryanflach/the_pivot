Rails.application.routes.draw do
  root to: 'home#index'
  resources :cart_items, only: [:create, :update]
  resources :cart, only: [:index]
  resources :items, only: [:index, :show]
  resources :orders, only: [:index]
  get '/:title', to: 'categories#show', as: :category
end
