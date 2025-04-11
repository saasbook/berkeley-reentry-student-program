# frozen_string_literal: true

class AdvisorsController < ApplicationController
  before_action :set_advisor, only: [:edit, :update, :destroy]

  def new
    @advisor = Advisor.new
  end

  def create
    @advisor = Advisor.new(advisor_params)
    if @advisor.save
      redirect_to manage_advisors_path, flash: { success: "Advisor created successfully." }
    else
      render :new, flash: { error: "Failed to create advisor." }
    end
  end
  def edit
  end

  def update
    if @advisor.update(advisor_params)
      redirect_to manage_advisors_path, flash: { success: "Advisor updated successfully." }
    else
      render :edit, flash: { error: "Failed to update advisor." }
    end
  end

  def destroy
    @advisor = Advisor.find(params[:id])
    if @advisor.destroy
      redirect_to manage_advisors_path, flash: { success: "Advisor deleted successfully." }
    else
      redirect_to manage_advisors_path, flash: { error: "Failed to delete advisor." }
    end
  end

  def show
    @advisor = Advisor.find(params[:id])
  end

  private
  def set_advisor
    @advisor = Advisor.find(params[:id])
  end

  def advisor_params
    params.require(:advisor).permit(:name, :description, :calendar, :active)
  end
end
