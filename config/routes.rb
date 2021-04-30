Rails.application.routes.draw do
  root "sessions#home"
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'user#create'

  get '/users/:id', to: 'users#show'
  post '/users/:id', to: 'user#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  get  '/logout', to: 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#omniauth'

  resources :users, only: [:new, :create, :show] do
    resources :vacations
  end
  resources :vacations do
    resources :goals
  end
end

# new index show