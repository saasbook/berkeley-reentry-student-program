# frozen_string_literal: true

class ScholarshipsController < ApplicationController
  before_action :require_login
  # Add admin permission check, only applies to actions that modify data
  before_action :check_admin_permission, only: [:new, :create, :edit, :update, :destroy]
  # Add set_scholarship callback, only applies to actions requiring a specific scholarship record
  before_action :set_scholarship, only: [:edit, :update, :show, :destroy] # Add :show if needed

  # GET /scholarships (replaces the original index)
  def index
    # This index might now be for all logged-in users, or you can adjust as needed
    @scholarships = Scholarship.all
    # Add pagination if necessary
  end

  # GET /scholarships/:id/edit (from admin)
  def edit
    # @scholarship is set by set_scholarship
  end

  # PATCH/PUT /scholarships/:id (from admin)
  def update
    if @scholarship.update(scholarship_params)
      flash[:notice] = "Scholarship updated successfully."
      # Redirect to the scholarships list page, adjust the path according to your routes
      redirect_to scholarships_path # Was admin_scholarships_path
    else
      flash.now[:alert] = "Failed to update scholarship."
      render :edit, status: :unprocessable_entity
    end
  end

  # GET /scholarships/new (from admin)
  def new
    @scholarship = Scholarship.new
  end

  # POST /scholarships (from admin)
  def create
    @scholarship = Scholarship.new(scholarship_params)
    if @scholarship.save
      flash[:notice] = "Scholarship created successfully."
      # Redirect to the scholarships list page
      redirect_to scholarships_path # Was admin_scholarships_path
    else
      flash.now[:alert] = "Failed to create scholarship."
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /scholarships/:id (from admin)
  def destroy
    @scholarship.destroy
    flash[:notice] = "Scholarship deleted successfully."
    # Redirect to the scholarships list page
    redirect_to scholarships_path # Was admin_scholarships_path
  end

  # If you need a show action
  def show
    @scholarship = Scholarship.find(params[:id])
  end

  private # Move the original require_login under private and add other private methods
  def require_login
    unless session.key?(:current_user_id) && Student.find_by_id(session[:current_user_id])
      redirect_to root_path, flash: { error: "Please log in first!" }
    end
  end

  # set_scholarship from admin
  def set_scholarship
    @scholarship = Scholarship.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Scholarship not found."
    # Adjust the redirect path as needed
    redirect_to scholarships_path # Was admin_scholarships_path
  end

  # scholarship_params from admin
  def scholarship_params
    # Ensure you permit all the attributes you want to be updatable through the form
    params.require(:scholarship).permit(:name, :description, :status_text, :application_url)
  end

  # check_admin_permission from admin
  def check_admin_permission
    # Implement your admin permission check logic here
    # Check if the current user is an admin
    # Note: This assumes admin info is stored in the Admin model and associated via session[:current_user_id]
    # You might need to adjust this logic to match your user and permission model
    # E.g., if the Student model has an is_admin flag:
    # current_student = Student.find_by_id(session[:current_user_id])
    # unless current_student&.is_admin

    # Or if admins are a different model:
    admin = Admin.find_by_id(session[:current_user_id]) # Assuming admins also use this session key
    unless admin # Or admin&.is_admin if Admin model has an is_admin field
      redirect_to root_path, flash: { error: "You don't have the permission to do that!" }
    end
    # If your admin and student user systems are separate, you need more complex logic to handle sessions
  end
end
