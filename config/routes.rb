Rails.application.routes.draw do
  get '/signup', to: 'users#new'


  resources :goals
  resources :users, only: [:new, :create, :show]
  resources :vacations

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
end
