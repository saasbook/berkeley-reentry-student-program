class CheckinController < ApplicationController

  # def new
  #   @checkin = Checkin.new
  #   # Get the current user to be used to autofill form info
  #   # @user = User.find_by_id(session[:current_user_id])
  #   # If cannot find user, then redirect to login
  #   # otherwise redirect to create
  #   # for testing
  #   @user = User.all.first
  #   redirect_to :action => "create"
  # end

  def create
    Time.zone = 'Pacific Time (US & Canada)'
    # Get the current user to be used to autofill form info
    # @user = User.find_by_id(session[:current_user_id])
    # If cannot find user, then redirect to login
    # otherwise redirect to create
    # for testing
    @user = User.create(first_name: "Jane", last_name: "Doe", sid: 123456789, email: "janedoe@email.com", password: "password", is_student: true, is_admin: false, is_staff: false)
    @checkin = Checkin.new
    @checkin.update(time: DateTime.now, student_id: @user.student_id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name)
    if @checkin.save(validate: false)
      redirect_to root_path, flash: { :success => "Success! You've been checked in!" }
    else
      redirect_to root_path, flash: { :error => "Something went wrong, please try again" }
    end
  end

end
