class UserController < ApplicationController
  def update
    flash.clear
    @user = User.find_by(id: session[:current_user_id])
    if @user.nil?
      redirect_to login_path, flash: { :error => "Please log-in!" }
      return
    end
    first_name = params[:user][:first_name]
    last_name = params[:user][:last_name]
    email = params[:user][:email]
    sid = params[:user][:sid]
    if sid.blank? or sid.length != 10
      redirect_to login_confirm_path, flash: { :error => "Invalid Student ID Number" }
      return
    end
    if @user.update(first_name: first_name, last_name: last_name, email: email, sid: sid)
      redirect_to root_path, flash: { :success => "Success! You've been logged-in!" }
    else
      redirect_to login_confirm_path, flash: { :error => "Something went wrong, please try again." }
    end
  end
end
