Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'vehicles#new'

  resources :users, only: [:index, :show, :new, :create, :update]
  resources :vehicles, only: [:index, :show, :new, :create]
  resources :insurances, only: [:index, :show, :new, :create]
  resources :sub_types, only: :index
end
