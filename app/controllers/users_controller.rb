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
  
  def profile_new
    flash.clear
  end

  def profile_update
    skipped = params.has_key? :skip
    unless skipped
      @user = Student.find_by_id(session[:current_user_id])
      @user.update!(profile_params)
    end
    redirect_to root_path, flash: { :success => "Success! You've been logged-in!" }
  end

  private

  def require_login
    unless session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { :error => "Please log-in first!" }
    end
  end

  def profile_params
    params.require(:profile).permit(:major, :grad_year, :identities, :pronouns)
  end
    
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :sid)
  end

end
