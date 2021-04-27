Rails.application.routes.draw do
  resources :goals
  resources :users
  resources :vacations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
end
