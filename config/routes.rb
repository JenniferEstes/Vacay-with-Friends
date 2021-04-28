Rails.application.routes.draw do
  root "sessions#home"
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'user#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :goals
  resources :users, only: [:new, :create, :show]
  resources :vacations

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
end
