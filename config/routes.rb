Rails.application.routes.draw do
  get '/:title', to: 'categories#show', as: :category
end
