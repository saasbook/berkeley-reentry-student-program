# frozen_string_literal: true

class ScholarshipsController < ApplicationController
  before_action :require_login

  def index
    # redirect_to "https://reentry.berkeley.edu/services/scholarships"
  end

  def require_login
    unless session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { error: "Please log in first!" }
    end
  end
end