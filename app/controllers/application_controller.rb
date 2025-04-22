# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def check_if_admin
    admin = Admin.find_by_id(session[:current_user_id])
    redirect_to root_path, flash: { error: "You must be an admin to access this page" } if !admin || !admin.is_admin
  end
end
