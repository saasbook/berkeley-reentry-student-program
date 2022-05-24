# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :require_login
  before_action :set_appointment, only: %w[show edit update destroy]

  # GET /appointments
  def index
    @upcoming = @user.upcoming_appts
    @past = @user.past_appts.limit(5)
  end

  def view_all_past_appointments
    unless (params.key? :page) || (params[:page] < 1)
      redirect_to view_all_past_appointments_path(page: 1)
      # return is needed here, otherwise the app will continue execute
      # the following instructions after redirect
      return
    end
    n = params[:page].to_i - 1
    all_past_appointments = @user.past_appts
    @past_appointments = ApplicationRecord.get_20_records(all_past_appointments, 'time DESC', n)
    @has_next_page = 20 * params[:page].to_i < all_past_appointments.all.size
  end

  # GET /appointments/1
  def show; end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit; end

  # POST /appointments
  def create; end

  # PATCH/PUT /appointments/1
  def update; end

  # DELETE /appointments/1
  def destroy; end

  # GET /appointments_student_profile_check
  def student_profile_check; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.fetch(:appointment, {})
  end
end
