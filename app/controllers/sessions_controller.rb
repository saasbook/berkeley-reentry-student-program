# frozen_string_literal: true

class SessionsController < ApplicationController
  def google_auth
    # Get access tokens from the google server
    access_token = request.env['omniauth.auth']
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
      redirect_to root_path, flash: { error: 'Something went wrong, please try again later.' }
    elsif user.save
      user_first_login(user)
    else
      redirect_to root_path, flash: { error: 'Something went wrong, please try again' }
    end
  end

  def google_auth_logout
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
    admins = ENV['ADMINS'].split(',')
    staff = ENV['STAFF'].split(',')
    return nil if admins.blank? || staff.blank?

    user.is_admin = admins.include? email
    user.is_staff = staff.include? email
    user.is_student = !user.is_admin && !user.is_staff
    user
  end
end
