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
    flash.clear
    Time.zone = 'Pacific Time (US & Canada)'
    # Get the current user to be used to autofill form info
    # @user = Student.find_by_id(session[:current_user_id])
    # If cannot find user, then redirect to login
    # otherwise redirect to create
    # for testing
    @user = Student.create(first_name: "Jane", last_name: "Doe", sid: 123456789, email: "janedoe@email.com", password: "password", is_student: true, is_admin: false, is_staff: false)
    @checkin = Checkin.new
    @checkin.time = DateTime.now
    @checkin.student_id = @user.id
    @checkin.student = @user
    # validate false for manual testing
    if @checkin.save(validate: false)
      redirect_to root_path, flash: { :success => "Success! You've been checked in!" }
    else
      redirect_to root_path, flash: { :error => "Something went wrong, please try again" }
    end
  end

end
