require 'rails_helper'
include FactoryBot::Syntax::Methods

describe AdminsController do
  describe "This following user types should be blocked from accessing admin dashboard: " do
    it "Student" do
      @stu = create :student
      session[:current_user_id] = @stu.id
      get :index
      expect(response).to redirect_to root_path
    end

    it "Staff" do
      @staff = create :staff
      session[:current_user_id] = @staff.id
      get :index
      expect(response).to redirect_to root_path
    end

    it "Logged out user" do
      session[:current_user_id] = nil
      get :index
      expect(response).to redirect_to root_path
    end
  end

end