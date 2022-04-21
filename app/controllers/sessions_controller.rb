# frozen_string_literal: true

class SessionsController < ApplicationController
  def google_auth
    # Get the official admins
    admins = ENV['ADMINS']
    staff = ENV['STAFF']
    if admins.blank? || staff.blank?
      redirect_to root_path, flash: { error: 'Something went wrong, please try again later.' }
      return
    end
    admins = admins.split(',')
    staff = staff.split(',')
    # Get access tokens from the google server
    access_token = request.env['omniauth.auth']
    existing_user = User.where(email: access_token.info.email).present?
    user = User.from_omniauth(access_token)
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    # set appropriate permissions
    user_is_admin = admins.include? access_token.info.email
    user_is_staff = staff.include? access_token.info.email
    if existing_user
      session[:current_user_id] = user.id
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
    else
      user.is_student = (!user_is_admin and !user_is_staff)
      user.is_admin = user_is_admin
      user.is_staff = user_is_staff
      if user.save
        session[:current_user_id] = user.id
        if user.is_student
          redirect_to login_confirm_path
        elsif user.is_admin
          redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
        else # user must be staff
          redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
        end
      else
        redirect_to root_path, flash: { error: 'Something went wrong, please try again' }
      end
    end
  end

  def google_auth_logout
    session.delete(:current_user_id)
    redirect_to root_path, flash: { success: "You've been successfully logged-out!" }
  end
end
