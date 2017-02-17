Rails.application.routes.draw do
  devise_for :users
  
  resources :trains do
    resources :wagons, shallow: true
  end
  
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time_station, on: :member
  end
  
  resources :routes

  resources :tickets

  resource :search

  root 'searches#show'

  # resources :wagons
  # resources :coupe_wagons, controller: 'wagons'
  # resources :sitting_wagons, controller: 'wagons'
  # resources :economy_wagons, controller: 'wagons'
  # resources :lux_wagons, controller: 'wagons'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
