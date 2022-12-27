Rails.application.routes.draw do
  resources :flights
  resources :airports

  resources :bookings do
    resources :passengers
  end

  root to: "flights#index"
end
