Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
end
