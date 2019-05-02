Rails.application.routes.draw do
  resources :getaways
  root 'static#home'
  get '/signup' => 'users#new'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
