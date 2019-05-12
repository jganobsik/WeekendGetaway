Rails.application.routes.draw do
  resources :travel_agencies
  resources :excursions
  resources :trips
  resources :accommodations
  resources :getaways
  root 'static#home'
  get '/dashboard' => 'static#dashboard'
  get '/signup' => 'users#new'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users
  resources :getaways


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
