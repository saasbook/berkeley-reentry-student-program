class AppointmentsController < ApplicationController
  before_action :require_login
  before_action :set_appointment, only: %w[ show edit update destroy ]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
  end

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
