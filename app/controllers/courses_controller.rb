# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :require_login, only: [:index]

  def index
    @courses = Course.where(available: true)
  end

  private
  def require_login
    unless session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { error: "Please log in first!" }
    end
  end
end
