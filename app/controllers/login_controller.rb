# frozen_string_literal: true

class LoginController < ApplicationController
  def confirm
    @user = User.find_by(id: session[:current_user_id])
    redirect_to root_path, flash: { error: "Please log-in first!" } if @user.nil?
  end

  def canvas_login
    unless Rails.application.credentials[:CANVAS_CLIENT_ID] && Rails.application.credentials[:CANVAS_URL] && Rails.application.credentials[:CANVAS_REDIRECT_URI]
      redirect_to root_path, flash: { error: "Canvas configuration is missing" }
      return
    end
    params = {
      client_id: Rails.application.credentials[:CANVAS_CLIENT_ID],
      response_type: "code",
      redirect_uri: Rails.application.credentials[:CANVAS_REDIRECT_URI],
      scope: "url:GET|/api/v1/users/self"
    }

    redirect_to "#{Rails.application.credentials[:CANVAS_URL]}/login/oauth2/auth?#{params.to_query}", allow_other_host: true
  end
end
