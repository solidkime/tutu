Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :wagons
  resources :coupe_wagons, controller: 'wagons'
  resources :sitting_wagons, controller: 'wagons'
  resources :economy_wagons, controller: 'wagons'
  resources :lux_wagons, controller: 'wagons'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
