# frozen_string_literal: true

class CheckinController < ApplicationController
  before_action :require_login

  def new
    flash.clear
    @reasons = Checkin.reasons
  end

  def create
    flash.clear
    @user = Student.find_by_id(session[:current_user_id])
    @checkin = Checkin.new
    @checkin.update(time: Time.current, student_id: @user.id, reason: params[:checkin][:reason])
    if @checkin.save
      redirect_to root_path, flash: { success: "Success! You've been checked in!" }
    else
      redirect_to root_path, flash: { error: 'Something went wrong, please try again' }
    end
  end

  private

  def require_login
    redirect_to root_path, flash: { error: 'Please log-in first!' } unless
      session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id])
  end
end
