class PagesController < ApplicationController
  before_action :authenticate

  def index

  end

  private

  def authenticate
    @user_type = Array.new
    user = User.find_by_id(session[:current_user_id])
    if user
      @logged_out = false
      @name = user.first_name + " " + user.last_name
      if user.is_admin
        @user_type.push 'Admin'
      end
      if user.is_staff
        @user_type.push 'Staff'
      end
      if user.is_student
        @user_type.push 'Student'
      end
    else
      @logged_out = true
    end
  end
end