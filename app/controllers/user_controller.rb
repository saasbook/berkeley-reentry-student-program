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
    if first_name.nil? or first_name.empty? or last_name.nil? or last_name.empty? or email.nil? or email.empty? or (sid.nil? or sid.empty? and @user.sid.nil?)
      redirect_to login_confirm_path, flash: { :error => "Something went wrong, please try again" }
      return
    end
    if sid.length != 10
      redirect_to login_confirm_path, flash: { :error => "Invalid Student ID Number" }
      return
    end
    if @user.first_name != first_name
      @user.update(first_name: first_name)
    end
    if @user.last_name != last_name
      @user.update(last_name: last_name)
    end
    if @user.email != email
      @user.update(email: email)
    end
    if @user.sid.nil? and @user.sid != sid
      @user.update(sid: sid.to_i)
    end
    redirect_to root_path, flash: { :success => "Success! You've been logged-in!" }
  end
end
