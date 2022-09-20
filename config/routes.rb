Rails.application.routes.draw do
  resources :chefs, only: [:index] do
    resources :dishes, only: [:show]
  end
end