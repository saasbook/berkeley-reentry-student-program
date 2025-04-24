# frozen_string_literal: true

# spec/requests/admins_spec.rb
require "rails_helper"

RSpec.describe "Admins", type: :request do
  describe "Access control for admin dashboard" do
    it "blocks a student from accessing the admin dashboard" do
      student = FactoryBot.create(:student)
      sign_in_as(student)
      get admins_path
      expect(response).to redirect_to(root_path)
    end

    it "blocks a staff member from accessing the admin dashboard" do
      staff = FactoryBot.create(:staff)
      sign_in_as(staff)
      get admins_path
      expect(response).to redirect_to(root_path)
    end

    it "blocks a logged out user from accessing the admin dashboard" do
      get admins_path
      expect(response).to redirect_to(root_path)
    end
  end

  describe "View checkin records" do
    before do
      admin = FactoryBot.create(:admin)
      sign_in_as(admin)
      50.times { FactoryBot.create(:checkin) }
    end

    it "redirects to itself with params[:page] == 1 if params[:page] is nil or invalid" do
      get view_checkin_records_path
      expect(response).to redirect_to(view_checkin_records_path(page: 1))
    end

    it "sets has_next_page to false if the current page is the last page of checkin records" do
      get view_checkin_records_path(page: Checkin.count / 20 + 1)
      expect(assigns(:has_next_page)).to be_falsey
    end
  end
end
