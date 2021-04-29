Rails.application.routes.draw do
  root "sessions#home"
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'user#create'

  get '/users/:id', to: 'users#show'
  post '/users/:id', to: 'user#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  #
  # get '/vacations/:id', to: 'vacations#show'
  # post '/vacations/:id', to: 'vacations#show'
  #
  # get '/vacations/:id/edit', to: 'vacations#edit'
  # post '/vacations/:id/edit', to: 'vacations#edit'
  #
  # get '/vacations/:id/edit', to: 'vacations#create'
  # post '/vacations/:id/edit', to: 'vacations#create'
  #
  # get '/goals', to: 'goals#index'
  # post 'goals', to: 'goals#index'
  # get '/goals/:id/edit', to: 'goals#edit'


  # resources :users, only: [:new, :create, :show] 

  resources :users, only: [:new, :create, :show] do
    resources :vacations
  end
  resources :vacations do
    resources :goals, only: [:edit]
  end

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
end

# new index show