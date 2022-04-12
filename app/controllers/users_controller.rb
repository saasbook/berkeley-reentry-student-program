class UsersController < ApplicationController
  # before_action :require_login

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
    unless session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id]).present?
      redirect_to login_path, :method => :get
    end
  end

  def profile_params
    params.require(:profile).permit(:major, :grad_year, :identities, :pronouns)
  end

end
