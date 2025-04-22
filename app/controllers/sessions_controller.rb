# frozen_string_literal: true

class SessionsController < ApplicationController
  def google_auth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    existing_user = User.where(email: access_token.info.email).first
    if existing_user.present?
      session[:current_user_id] = existing_user.id
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
      return
    end
    user = User.from_omniauth(access_token)
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    # set appropriate permissions
    user = set_user_permission(user, access_token.info.email)
    if !user
      redirect_to root_path, flash: { error: "Something went wrong, please try again later." }
    elsif user.save
      user_first_login(user)
    else
      redirect_to root_path, flash: { error: "Something went wrong, please try again" }
    end
  end

  def google_auth_logout
    session.delete(:current_user_id)
    redirect_to root_path, flash: { success: "You've been successfully logged-out!" }
  end

  # Canvas authentication
  def canvas_callback
    if ENV["MOCK_CANVAS_LOGIN"] == "true"
      # Read the role from params (default to "student" if none)
      role = params[:mock_role] || "student"

      fake_email = case role
                   when "admin"
                     "169reentryadmin@berkeley.edu"
                   else
                     "studentuser@berkeley.edu"
      end

      user = User.find_or_initialize_by(email: fake_email)

      if user.new_record?
        user.first_name = role.capitalize
        user.last_name = "Mock"
        user.email = fake_email
        if role == "student"
          user.sid = "12345678"
        end
      end

      user = set_user_permission(user, fake_email)
      user.save!
      session[:current_user_id] = user.id

      redirect_to root_path, flash: { success: "Logged in as #{role.capitalize} mock user." }
      return
    end

    if params[:error].present? || params[:code].blank?
      redirect_to root_path, alert: "Authentication failed. Please try again."
      return
    end

    access_token = get_access_token(params[:code])

    response = Faraday.get("#{ENV["CANVAS_URL"]}/api/v1/users/self?") do |req|
      req.headers["Authorization"] = "Bearer #{access_token.token}"
    end

    if response.success?
      user_data = JSON.parse(response.body)
      existing_user = User.where(email: user_data["email"]).first
      if existing_user.present?
        session[:current_user_id] = existing_user.id
        redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
        return
      end
    end
    user = User.from_canvas(user_data)
    # user.canvas_token = access_token.token
    # user.canvas_refresh_token = access_token.credentials.refresh_token if access_token.credentials.refresh_token.present?
    user = set_user_permission(user, user_data["email"])
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
    else
      redirect_to root_path, flash: { error: "Something went wrong, please try again." }
    end
  end

  def get_access_token(code)
    client = OAuth2::Client.new(
      ENV["CANVAS_CLIENT_ID"],
      ENV["CANVAS_CLIENT_SECRET"],
      site: ENV["CANVAS_URL"],
      token_url: "/login/oauth2/token"
    )
    client.auth_code.get_token(code, redirect_uri: :canvas_callback)
  end

  def canvas_auth_logout
    session.delete(:current_user_id)
    redirect_to root_path, flash: { success: "You've been successfully logged-out!" }
  end



  private
  def user_first_login(user)
    session[:current_user_id] = user.id
    if user.is_student
      redirect_to login_confirm_path
    elsif user.is_admin
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
    else # user must be staff
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
    end
  end

  def set_user_permission(user, email)
    # Get the official admins
    admins = ENV["ADMINS"].split(",")
    staff = ENV["STAFF"].split(",")
    return nil if admins.blank? || staff.blank?

    user.is_admin = admins.include? email
    user.is_staff = staff.include? email
    user.is_student = !user.is_admin && !user.is_staff
    user
  end
end
