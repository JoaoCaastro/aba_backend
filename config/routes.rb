Rails.application.routes.draw do
  resources :clients, only: [:index, :create, :show, :update, :destroy]
  resources :parents, only: [:index, :create, :show, :update, :destroy]
end
