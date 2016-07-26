Rails.application.routes.draw do
  get '/:title', to: 'categories#show', as: :category
  resources :items, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
