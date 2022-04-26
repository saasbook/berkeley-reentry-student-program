# frozen_string_literal: true

class LoginController < ApplicationController
  def confirm
    @user = User.find_by(id: session[:current_user_id])
    redirect_to root_path, flash: { error: 'Please log-in first!' } if @user.nil?
  end
end
