Rails.application.routes.draw do
  resources :clientes, only: [:index, :create, :show, :update, :destroy]
  resources :parent_guardians, only: [:index, :create, :show, :update, :destroy]
end
