class CheckinController < ApplicationController

  def new
    @checkin_record = CheckinRecord.new
    #Get the current user to be used to autofill form info
    #@user = User.find_by_id(session[:current_user_id])
  end

end
