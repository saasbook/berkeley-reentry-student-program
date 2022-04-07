Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#index'
  # route GET /login to login controller and #index action
  get "login", to: "login#index"
  get "login/confirm", to: "login#confirm"
  # route GET /check-in to login controller and #index action
  get "checkin", to: "checkin#new"
  post "checkin", to: "checkin#create"
  # the admin dashboard
  get "admins", to: "admins#index"
  get "view_checkin_records", to: "admins#view_checkin_records"
  # Routes for Google authentication
  get "auth/google_oauth2/callback", to: "sessions#googleAuth", as: "google_login"
  get "auth/failure", to: redirect('/')
  get "logout", to: "sessions#googleAuthLogout"
  # routes for user
  patch "user", to: "user#update"
end
