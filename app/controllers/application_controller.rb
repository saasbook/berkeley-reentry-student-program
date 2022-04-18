class ApplicationController < ActionController::Base
  def require_login
    unless session.has_key? :current_user_id and Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { :error => "Please log-in first!" }
    end
  end
  
end
