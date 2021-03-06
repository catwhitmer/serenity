Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/singup', to: 'users#new'

  get '/auth/facebook/callback', to: 'sessions#fbcreate'

  get '/users/:id/appointments', to: 'appointments#index', as:"user_appointment"
  post '/massages/:id/appointments/new', to: 'appointments#create', as:"new_massage_appointment"
  
  resources :appointments
  resources :users 
  resources :massages do 
    resources :appointments, only: [:new, :index]
  end
  
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
