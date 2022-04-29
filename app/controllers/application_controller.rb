# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def require_login
    @user = nil
    if session.has_key? :current_user_id
      @user = User.find_by_id(session[:current_user_id])
    end
    if @user
      # change user's type so it can use student/admin/staff only methods
      if @user.is_student
        @user = Student.find_by_id(session[:current_user_id])
      end
      if @user.is_staff
        @user = Staff.find_by_id(session[:current_user_id])
      end
      if @user.is_admin
        @user = Admin.find_by_id(session[:current_user_id])
      end
    end
    unless @user
      redirect_to root_path, flash: { :error => "Please log-in first!" }
    end
  end
  
end
