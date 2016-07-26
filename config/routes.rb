Rails.application.routes.draw do
  resources :cart_items, only: [:create]
  resources :cart, only: [:index]
  resources :items, only: [:index]
  get '/:title', to: 'categories#show', as: :category
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
