# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :require_login

  def advisors
    @advisors = Advisor.where(active: true)
  end

  def require_login
    unless (session.has_key? :current_user_id) && Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { error: "Please log in first!" }
    end
  end
end
