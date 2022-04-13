class LoginController < ApplicationController

  def index
    flash.clear
  end

  def confirm
    @user = User.find_by(id: session[:current_user_id])
    if @user.nil?
      redirect_to root_path, flash: { :error => "Please log-in first!" }
    end

  end

end
