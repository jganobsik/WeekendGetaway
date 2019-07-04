Rails.application.routes.draw do
  resources :travel_agencies do
    resources :getaways, only: [:new, :index]
  end
  resources :excursions
  resources :trips
  resources :accommodations
  resources :getaways
  root 'static#home'
  get '/dashboard' => 'static#dashboard', as: :dashboard
  get '/signup' => 'users#new'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'flights' => 'getaways#flights', as: :flight
  get 'roadtrips' => 'getaways#roadtrips', as: :roadtrip
  get '/auth/facebook/callback' => 'sessions#fb_create'
  get '/users/toptwo' => 'users#toptwo', as: :top_users
  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
