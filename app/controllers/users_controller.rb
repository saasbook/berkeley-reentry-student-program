class UsersController < ApplicationController
  before_action :require_login

  def profile_new
    flash.clear
  end

  def profile_update
    skipped = params.has_key? :skip
    edited = params.has_key? :submit_edit
    unless skipped
      @user = Student.find_by_id(session[:current_user_id])
      @user.update!(profile_params)
    end
    if edited
      redirect_to root_path, flash: { :success => "Success! Your profile has been updated." }
    else
      redirect_to root_path, flash: { :success => "Success! You've been logged-in!" }
    end
  end

  def profile_edit
    flash.clear
    @user = Student.find_by_id(session[:current_user_id])
  end

  private

  def require_login
    unless session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id]).present?
      user = Student.find_by_id(session[:current_user_id])
      unless user&.is_student
        redirect_to root_path, flash: { :error => "Only students have access to profiles." }
      end
    end
  end

  def profile_params
    params.require(:profile).permit(:major, :grad_year, :identities, :pronouns)
  end

end
