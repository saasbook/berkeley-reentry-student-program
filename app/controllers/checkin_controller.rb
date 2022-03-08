class CheckinController < ApplicationController

  def new
    @checkin = Checkin.new
    #Get the current user to be used to autofill form info
    #@user = User.find_by_id(session[:current_user_id])
    # for testing purposes only
    @user = User.all.first
  end

  def create

  end

end
