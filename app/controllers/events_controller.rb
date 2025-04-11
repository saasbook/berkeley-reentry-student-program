# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_login

  def index
    @upcoming_events = Event.where("date >= ?", Date.today).order(:date)
    @past_events = Event.where("date < ?", Date.today).order(date: :desc).limit(5)
  end

  def require_login
    unless session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { error: "Please log in first!" }
    end
  end
end
