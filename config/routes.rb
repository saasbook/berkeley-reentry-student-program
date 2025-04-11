# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#index"
  # route GET /check-in to login controller and #index action
  get "checkin", to: "checkin#new", as: "new_checkin"
  post "checkin", to: "checkin#create", as: "checkin"
  # appointments page
  get "appointments", to: "appointments#advisors"
  # scholarships page
  get "scholarships/new", to: "admins#new", as: :new_scholarship
  get "scholarships", to: "scholarships#index"
  get "scholarships/:id", to: "scholarships#show", as: :scholarship
  get "edit_scholarships", to: "admins#edit_scholarships"
  post "scholarships", to: "admins#create", as: :create_scholarship
  get "scholarships/:id/edit", to: "admins#edit", as: :edit_scholarship
  patch "scholarships/:id", to: "admins#update", as: :update_scholarship
  delete "scholarships/batch_delete", to: "admins#batch_delete", as: :batch_delete_scholarships
  delete "scholarships/:id", to: "admins#destroy", as: :destroy_scholarship
  # podcast page
  get "podcasts", to: "podcasts#index"
  # courses page
  get "courses", to: "courses#index"
  # events page
  get "events", to: "events#index"
  # the admin dashboard
  get "admins", to: "admins#index"
  get "view_checkin_records", to: "admins#view_checkin_records"

  namespace :admin do
    resources :events
  end

  # advisor routes
  get "manage_advisors", to: "admins#manage_advisors", as: "manage_advisors"
  get "/advisors/new", to: "advisors#new"
  post "/advisors", to: "advisors#create"
  get "/advisors/:id/edit", to: "advisors#edit", as: "edit_advisor"
  patch "/advisors/:id", to: "advisors#update"
  delete "/advisors/:id", to: "advisors#destroy", as: "delete_advisor"
  get "/advisors/:id", to: "advisors#destroy"

  # user routes
  patch "user", to: "users#update"
  get "user/profile/new", to: "users#profile_new", as: "user_profile_new"
  patch "user/profile/update", to: "users#profile_update", as: "user_profile_update"
  get "user/profile/edit", to: "users#profile_edit", as: "user_profile_edit"

  # Routes for Google authentication
  get "auth/google_oauth2/callback", to: "sessions#google_auth", as: "google_login"
  get "auth/failure", to: redirect("/")
  get "logout", to: "sessions#google_auth_logout"
  get "login/confirm", to: "login#confirm"

  # Routes for Canvas authentication
  post "login/canvas", to: "login#canvas_login", as: "canvas_login"
  get "auth/canvas/callback", to: "sessions#canvas_callback", as: "canvas_callback"
end
