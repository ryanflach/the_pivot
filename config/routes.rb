Rails.application.routes.draw do
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  resources :items, only: [:index]
  get '/:title', to: 'categories#show', as: :category
end
