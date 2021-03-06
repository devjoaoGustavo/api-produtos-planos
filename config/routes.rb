Rails.application.routes.draw do
  root 'home#welcome'

  namespace :api, defaults: { format: 'json' } do

    resources :products, only: [:create, :show, :index, :update] do
      resources :plans, only: [:index]
    end
    resources :plans, only: [:create, :show, :index, :update] do
      resources :prices, only: :index
    end
    resources :prices, only: [:show, :create]
    resources :periodicities, only: [:create, :index, :update, :show]
  end

  resources :products, only: [:new, :create, :show, :edit, :update]
  resources :plans, only: [:new, :create, :show, :edit, :update]
end
