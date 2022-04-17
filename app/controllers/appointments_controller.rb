class AppointmentsController < ApplicationController
  before_action :require_login
  before_action :set_appointment, only: %w[ show edit update destroy ]

  # GET /appointments
  def index
    @upcoming = @user.upcoming_appts
    @past = @user.past_appts.limit(5)
  end

  # GET /appointments/1
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
  def create
  end

  # PATCH/PUT /appointments/1
  def update
  end

  # DELETE /appointments/1
  def destroy
  end

  # GET /appointments_student_profile_check
  def student_profile_check
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.fetch(:appointment, {})
    end
end
