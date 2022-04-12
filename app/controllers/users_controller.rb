class UsersController < ApplicationController
  before_action :require_login

  def update
    flash.clear
    @user = User.find_by(id: session[:current_user_id])
    sid = params[:user][:sid]
    if sid.blank? or sid.length != 10
      redirect_to login_confirm_path, flash: { :error => "Invalid Student ID Number" }
      return
    end
    if @user.update(user_params)
      redirect_to root_path, flash: { :success => "Success! You've been logged-in!" }
    else
      redirect_to login_confirm_path, flash: { :error => "Something went wrong, please try again." }
    end
  end

  private

  def require_login
    unless session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id])
      redirect_to login_path, :method => :get
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :sid)
  end

end
