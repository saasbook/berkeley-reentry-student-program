# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login

  def update
    flash.clear
    @user = User.find_by(id: session[:current_user_id])
    sid = params[:user][:sid]
    email = params[:user][:email]
    if sid.blank? || (sid.length != 10)
      redirect_to login_confirm_path, flash: { error: 'Invalid Student ID Number.' }
      return
    end
    if email.blank? || !email.match(/.+(@berkeley.edu)/)
      redirect_to login_confirm_path, flash: { error: 'Please use your berkeley email to log-in.' }
      return
    end
    if @user.update(user_params)
      redirect_to user_profile_new_path
    else
      redirect_to login_confirm_path, flash: { error: 'Something went wrong, please try again.' }
    end
  end

  def profile_new
    flash.clear
    @user = Student.find_by_id(session[:current_user_id])
  end

  def profile_update
    skipped = params.key? :skip
    edited = params.key? :submit_edit
    unless skipped
      @user = Student.find_by_id(session[:current_user_id])
      @user.update!(profile_params)
    end
    if edited
      redirect_to root_path, flash: { success: 'Success! Your profile has been updated.' }
    else
      redirect_to root_path, flash: { success: "Success! You've been logged-in!" }
    end
  end

  def profile_edit
    flash.clear
    @user = Student.find_by_id(session[:current_user_id])
  end

  private

  def require_login
    redirect_to root_path, flash: { error: 'Only students have access to profiles.' } unless
      session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id]).present?
  end

  def profile_params
    params.require(:profile).permit(:major, :grad_year, :identities, :pronouns)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :sid)
  end
end
