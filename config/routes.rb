Rails.application.routes.draw do
  resources :clients do
    resources :parents
    resources :protocols
  end
end
