Rails.application.routes.draw do
  resources :clientes, only: [:index, :create, :show, :update, :destroy]
end
