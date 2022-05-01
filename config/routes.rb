# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#index'
  # route GET /check-in to login controller and #index action
  get "checkin", to: "checkin#new"
  post "checkin", to: "checkin#create"
  #appointments page
  get 'appointments', to: "appointments#advisors"
  # the admin dashboard
  get 'admins', to: 'admins#index'
  get 'view_checkin_records', to: 'admins#view_checkin_records'
  # user routes
  patch 'user', to: 'users#update'
  get 'user/profile/new', to: 'users#profile_new', as: 'user_profile_new'
  patch 'user/profile/update', to: 'users#profile_update', as: 'user_profile_update'
  get 'user/profile/edit', to: 'users#profile_edit', as: 'user_profile_edit'
  # Routes for Google authentication
  get 'auth/google_oauth2/callback', to: 'sessions#google_auth', as: 'google_login'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#google_auth_logout'
  get 'login/confirm', to: 'login#confirm'
end
