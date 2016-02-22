Rails.application.routes.draw do
  resources :products, only: [:create, :show, :index, :update] do
    resources :plans, only: [:index]
  end
  resources :plans, only: [:create, :show, :index, :update]
  resources :prices, only: [:index, :show, :create]
  resources :periodicities, only: [:create, :index, :update, :show]
end
