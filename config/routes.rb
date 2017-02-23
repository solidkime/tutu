Rails.application.routes.draw do
  devise_for :users

  resources :tickets
  
  resource :search

  namespace :admin do
    get '/dashboard', to: 'dashboard#dashboard'
    resources :trains do
      resources :wagons, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time_station, on: :member
    end

    resources :routes do
      patch :add_railway_station, on: :member
    end
    resources :tickets
  end

  root 'searches#show'

  # resources :wagons
  # resources :coupe_wagons, controller: 'wagons'
  # resources :sitting_wagons, controller: 'wagons'
  # resources :economy_wagons, controller: 'wagons'
  # resources :lux_wagons, controller: 'wagons'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
