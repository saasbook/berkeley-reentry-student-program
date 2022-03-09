class CheckinController < ApplicationController

  def new
    @checkin = Checkin.new
    # Get the current user to be used to autofill form info
    # @user = User.find_by_id(session[:current_user_id])
    # If cannot find user, then redirect to login
    # otherwise redirect to create
    # for testing
    @user = User.all.first
    redirect_to :action => "create"
  end

  def create
    # required = [:first_name => "first name", :last_name => "last name", :email => "email", :sid => "Student ID"]
    # form_complete = true
    # incomplete_items = []
    # required.each do |key, val|
    #   if @user and not params[key].blank?
    #     next
    #   else
    #     form_complete = false
    #     incomplete_items.append(val)
    #   end
    # end
    # unless form_complete
    #   redirect_to :controller => 'checkin', :action => 'new', alert: "The following fields must be complete: %s" % incomplete_items.join(', ') and return
    # end
    Time.zone = 'Pacific Time (US & Canada)'
    @checkin = Checkin.new
    # Get the current user to be used to autofill form info
    # @user = User.find_by_id(session[:current_user_id])
    # If cannot find user, then redirect to login
    # otherwise redirect to create
    # for testing
    @user = Student.all.first
    puts @user.sid
    @checkin.update(time: DateTime.now, sid: @user.sid, email: @user.email, first_name: @user.first_name, last_name: @user.last_name)
    if @checkin.save(validate: false)
      redirect_to root_path, flash: { :success => "Success! You've been checked in!" }
    else
      redirect_to root_path, flash: { :error => "Something went wrong, please try again" }
    end
  end

end
