# frozen_string_literal: true

class Admin::EventsController < ApplicationController
  before_action :check_if_admin

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path, notice: "Event created successfully."
    else
      flash.now[:alert] = "Missing values. Failed to create event."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_events_path, notice: "Event updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path, notice: "Event deleted successfully."
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :start_time, :end_time, :location, :description, :flyer) # may change later, not sure what we want to include
  end
end
