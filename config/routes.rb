Rails.application.routes.draw do
  resources :products, only: [:create, :show, :index]
end
