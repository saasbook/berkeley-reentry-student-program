require 'rails_helper'
include FactoryBot::Syntax::Methods

describe PagesController do
  describe "logged out user" do
    it "should not have any user_type" do
      controller.session[:current_user_id] = nil
      get :index
      expect(assigns(:user_type).empty?).to be_truthy
    end
  end

  describe "logged in student" do
    before do
      student = create :student
      controller.session[:current_user_id] = student.id
      get :index
    end

    it "should identified as Student" do
      expect(assigns(:user_type)).to include 'Student'
    end

    it "name should be saved" do
      expect(assigns(:name)).to be_truthy
    end
  end

  describe "logged in staff" do
    before do
      staff = create :staff
      controller.session[:current_user_id] = staff.id
      get :index
    end
  
    it "should identified as Staff" do
      expect(assigns(:user_type)).to include 'Staff'
    end
  
    it "name should be saved" do
      expect(assigns(:name)).to be_truthy
    end
  end
  
  describe "logged in Admin" do
    before do
      admin = create :admin
      controller.session[:current_user_id] = admin.id
      get :index
    end
  
    it "should identified as Admin" do
      expect(assigns(:user_type)).to include 'Admin'
    end
  
    it "name should be saved" do
      expect(assigns(:name)).to be_truthy
    end
  end

end