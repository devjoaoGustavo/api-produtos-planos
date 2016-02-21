Rails.application.routes.draw do
  resources :products, only: [:create, :show, :index, :update]

  resources :plans, only: [:create, :show, :index, :update] do
    resources :periodicities, only: :show do
      resources :prices, only: [:index, :show, :create]
    end
  end

  resources :periodicities, only: [:create, :index, :update, :show]
end
