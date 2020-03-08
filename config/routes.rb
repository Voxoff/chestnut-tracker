Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
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

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
