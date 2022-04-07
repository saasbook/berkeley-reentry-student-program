class SessionsController < ApplicationController

    def google_auth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        existing_user = User.where(email: access_token.info.email).present?
        user = User.from_omniauth(access_token)
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        if user.save
            if existing_user
                redirect_to root_path, flash: { :success => "Success! You've been logged-in!" }
            else
                session[:current_user_id] = user.id
                redirect_to login_confirm_path
            end
        else
            redirect_to root_path, flash: { :error => "Something went wrong, please try again" }
        end
    end

    def google_auth_logout
        session.delete(:current_user_id)
        redirect_to root_path, flash: { :success => "You've been successfully logged-out!" }
    end
end 