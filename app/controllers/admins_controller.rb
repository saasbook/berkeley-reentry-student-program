# frozen_string_literal: true

# handle all access from admin user
class AdminsController < ApplicationController
  before_action :check_permission

  def index; end

  def view_checkin_records
    if (!params.key? :page) || (params[:page].to_i < 1)
      redirect_to view_checkin_records_path(page: 1)
      # return is needed here, otherwise the app will continue execute
      # the following instructions after redirect
      return
    end
    n = params[:page].to_i - 1
    @checkin_records = Checkin.get_20_checkin_records(n)
    @has_next_page = @checkin_records.size == 20
  end

  def manage_advisors
    @advisors = Advisor.all
  end

  def edit_scholarships
    @scholarships = Scholarship.all
  end

  def new
    @scholarship = Scholarship.new
    render "admins/scholarships/new"
  end

  def create
    @scholarship = Scholarship.new(scholarship_params)
    if @scholarship.save
      redirect_to edit_scholarships_path, notice: "Scholarship was successfully created."
    else
      render "admins/scholarships/new"
    end
  end

  def edit
    @scholarship = Scholarship.find(params[:id])
    render "admins/scholarships/edit"
  end

  def update
    @scholarship = Scholarship.find(params[:id])
    if @scholarship.update(scholarship_params)
      redirect_to edit_scholarships_path, notice: "Scholarship was successfully updated."
    else
      render "admins/scholarships/edit"
    end
  end

  def destroy
    @scholarship = Scholarship.find(params[:id])
    @scholarship.destroy
    redirect_to edit_scholarships_path, notice: "Scholarship was successfully deleted."
  end

  def batch_delete
    scholarship_ids = params[:scholarship_ids]
    if scholarship_ids.present?
      Scholarship.where(id: scholarship_ids).destroy_all
      redirect_to edit_scholarships_path, notice: "Selected scholarships were successfully deleted."
    else
      redirect_to edit_scholarships_path, alert: "No scholarships were selected for deletion."
    end
  end

  def manage_courses
    @courses = Course.all
    render "admins/courses/manage" # Explicitly specify the template to render
  end

  def new_course
    @course = Course.new
    render "admins/courses/new"
  end

  def create_course
    @course = Course.new(course_params)
    if @course.save
      redirect_to manage_courses_path, notice: "Course was successfully created."
    else
      render "admins/courses/new"
    end
  end

  def edit_course
    @course = Course.find(params[:id])
    render "admins/courses/edit"
  end

  def update_course
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to manage_courses_path, notice: "Course was successfully updated."
    else
      render "admins/courses/edit"
    end
  end

  def destroy_course
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to manage_courses_path, notice: "Course was successfully deleted."
  end

  def export_courses
    @courses = Course.all
    respond_to do |format|
      format.csv { send_data Course.to_csv, filename: "courses-#{Date.today}.csv" }
    end
  end

  private
  def check_permission
    admin = Admin.find_by_id(session[:current_user_id])
    redirect_to root_path, flash: { error: "You don't have the permission to do that!" } if !admin || !admin.is_admin
  end

  def scholarship_params
    params.require(:scholarship).permit(:name, :description, :status_text, :application_url)
  end

  def course_params
    params.require(:course).permit(:code, :title, :description, :units, :semester, :schedule, :ccn, :location, :available)
  end

  def require_admin
    unless current_user&.admin?
      flash[:error] = "You must be an admin to access this page."
      redirect_to root_path
    end
  end
end
