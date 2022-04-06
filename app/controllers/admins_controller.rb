class AdminsController < ApplicationController
  before_action :check_permission

  def index
  end

  def view_checkin_records
    if !params.has_key? :page || params[:page] < 1
      redirect_to view_checkin_records_path(page: 1)
      # return is needed here, otherwise the app will continue execute 
      # the following instructions after redirect
      return
    end
    n = params[:page].to_i - 1
    @checkin_records = Checkin.get_20_checkin_records(n)
    @has_next_page = @checkin_records.size == 20
  end

  private
  
  def check_permission
    admin = Admin.find_by_id(session[:current_user_id])
    if !admin || !admin.is_admin
      redirect_to root_path, flash: { :error => "You don't have the permission to do that!" }
    end
  end
end
