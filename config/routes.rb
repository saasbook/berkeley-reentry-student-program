Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#index'
  # route GET /login to login controller and #index action
  get "login", to: "login#index"
  # route GET /check-in to login controller and #index action
  get "checkin", to: "checkin#new"
  post "checkins", to: "checkin#create"
end
