Rails.application.routes.draw do
  resources :flights
  resources :passengers
  resources :airports
  resources :bookings
  resources :tickets

  root to: "flights#index"
end
