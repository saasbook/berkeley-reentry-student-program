class CheckinController < ApplicationController

  def new
    @checkin = Checkin.new
    # Get the current user to be used to autofill form info
    # @user = User.find_by_id(session[:current_user_id])
  end

  def create
    required = [:first_name => "first name", :last_name => "last name", :email => "email", :sid => "Student ID"]
    form_complete = true
    incomplete_items = []
    required.each do |key, val|
      if params.has_key? key and not params[key].blank?
        next
      else
        form_complete = false
        incomplete_items.append(val)
      end
    end
    unless form_complete
      redirect_to :controller => 'checkin', :action => 'new', alert: "The following fields must be complete: %s" % incomplete_items.join(', ') and return
    end
    Time.zone = 'Pacific Time (US & Canada)'
    @checkin.update(time: DateTime.now, student_id: :sid, email: :email, first_name: :first_name, last_name: :last_name)

  end

end
