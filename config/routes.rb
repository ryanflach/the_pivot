Rails.application.routes.draw do
  root to: 'home#index'
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  resources :items, only: [:index, :show]
  get '/:title', to: 'categories#show', as: :category
end
