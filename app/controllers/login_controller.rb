# frozen_string_literal: true

class LoginController < ApplicationController
  def confirm
    @user = User.find_by(id: session[:current_user_id])
    redirect_to root_path, flash: { error: "Please log-in first!" } if @user.nil?
  end

  def canvas_login
    unless ENV["CANVAS_CLIENT_ID"] && ENV["CANVAS_URL"] && ENV["CANVAS_REDIRECT_URI"]
      redirect_to root_path, flash: { error: "Canvas configuration is missing" }
      return
    end
    params = {
      client_id: ENV["CANVAS_CLIENT_ID"],
      response_type: "code",
      redirect_uri: ENV["CANVAS_REDIRECT_URI"],
      scope: "url:GET|/api/v1/users/self"
    }

    redirect_to "#{ENV["CANVAS_URL"]}/login/oauth2/auth?#{params.to_query}", allow_other_host: true
  end
end
