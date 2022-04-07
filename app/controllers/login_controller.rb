class LoginController < ApplicationController

  def index
    flash.clear
  end

  def confirm
    @user = User.find_by(id: session[:current_user_id])
    if @user.nil?
      redirect_to login_path
    end

  end

end
