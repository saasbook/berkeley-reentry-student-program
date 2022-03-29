class AdminsController < ApplicationController
  before_action :check_permission

  def index
  end

  def view_checkin_records
    @checkin_records = Checkin.order(time: :desc).limit(10)
  end

  private
  
  def check_permission
    admin = Admin.find_by_id(session[:current_user_id])
    if !admin || !admin.is_admin
      redirect_to root_path, flash: { :error => "You don't have the permission to do that!" }
    end
  end
end
