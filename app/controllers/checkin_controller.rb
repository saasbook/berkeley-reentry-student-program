# frozen_string_literal: true

class CheckinController < ApplicationController
  before_action :require_login
  before_action :set_user_and_reasons

  def new
    flash.clear
    @checkin = Checkin.new
    set_default_reason
  end

  def create
    flash.clear
    reason = params.dig(:checkin, :reason)

    # Only check if reason is present
    if reason.blank?
      flash[:error] = "Something went wrong, please try again"
      redirect_to root_path
      return
    end

    @checkin = @user.checkins.build(
      reason: reason,
      time: Time.current
    )

    if @checkin.save
      redirect_to root_path, flash: { success: "Success! You've been checked in!" }
    else
      flash[:error] = "Something went wrong, please try again"
      redirect_to root_path
    end
  end

  private
  def set_user_and_reasons
    @user = Student.find_by_id(session[:current_user_id])
    @reasons = Checkin.reasons
  end

  def set_default_reason
    @default_reason = if @user && @user.checkins.exists?
      @user.checkins.order(time: :desc).first.reason
    else
      @reasons.first
    end
  end

  def require_login
    unless session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { error: "Please log-in first!" }
    end
  end
end
