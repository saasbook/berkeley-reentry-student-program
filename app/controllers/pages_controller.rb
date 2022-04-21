# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate

  def index; end

  private

  def authenticate
    @user_type = []
    user = User.find_by_id(session[:current_user_id])
    if user
      @logged_out = false
      @name = "#{user.first_name} #{user.last_name}"
      @user_type.push 'Admin' if user.is_admin
      @user_type.push 'Staff' if user.is_staff
      @user_type.push 'Student' if user.is_student
    else
      @logged_out = true
    end
  end
end
