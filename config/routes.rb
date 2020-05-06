Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/singup', to: 'users#new'
  
  resources :appointments
  resources :users 
  resources :massages do 
    resources :appointments
  end

  
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
