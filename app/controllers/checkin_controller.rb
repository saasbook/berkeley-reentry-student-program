class CheckinController < ApplicationController
  before_action :require_login

  def create
    flash.clear
    Time.zone = 'Pacific Time (US & Canada)'
    @user = Student.find_by_id(session[:current_user_id])
    @checkin = Checkin.new
    @checkin.update(time: DateTime.now, student_id: @user.id)
    @checkin.student = @user
    if @checkin.save
      redirect_to root_path, flash: { :success => "Success! You've been checked in!" }
    else
      redirect_to root_path, flash: { :error => "Something went wrong, please try again" }
    end
  end

  private

  def require_login
    unless session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id])
      redirect_to login_path, :method => :get
    end
  end

end
