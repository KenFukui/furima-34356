Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :buy_items, only: [:index, :create]
  end
end
