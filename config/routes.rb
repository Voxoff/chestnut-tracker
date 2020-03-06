Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :organisations
      resources :users, only: [:create]
      post 'signup', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :trackers, only: :show
    end
  end
end
