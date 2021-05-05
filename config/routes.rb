Rails.application.routes.draw do
  root "sessions#home"

  get '/signup', to: 'users#new'
  post '/signup', to: 'user#create'

  get '/users/:id', to: 'users#show'
  post '/users/:id', to: 'user#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'auth/github', as: 'github_login'
  get '/auth/:provider/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :groups do
    resources :vacations, except: [:destroy]
  end
  resources :vacations, except: [:destroy] do
    resources :goals
  end
end