Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :create, :update, :destroy]
  resources :lists, only: [:index, :create, :destroy]
end
