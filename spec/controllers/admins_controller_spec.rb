# frozen_string_literal: true

require 'rails_helper'
include FactoryBot::Syntax::Methods

describe AdminsController do
  describe 'This following user types should be blocked from accessing admin dashboard: ' do
    it 'Student' do
      @stu = create :student
      session[:current_user_id] = @stu.id
      get :index
      expect(response).to redirect_to root_path
    end

    it 'Staff' do
      @staff = create :staff
      session[:current_user_id] = @staff.id
      get :index
      expect(response).to redirect_to root_path
    end

    it 'Logged out user' do
      session[:current_user_id] = nil
      get :index
      expect(response).to redirect_to root_path
    end
  end

  describe 'view checkin records' do
    before do
      admin = create :admin
      session[:current_user_id] = admin.id
      50.times do
        create :checkin
      end
    end

    it "redirect to itself with params[:page] == 1
    if it doesn't have params[:page] or params[:page] is invalid" do
      controller.params[:page] = nil
      get :view_checkin_records
      expect(response).to redirect_to view_checkin_records_path(page: 1)
    end

    it 'set has_next_page to false current page is the last checkin records' do
      controller.params[:page] = Checkin.all.size / 20 + 1
      get :view_checkin_records
      expect(@has_next_page).to be_falsey
    end
  end
end
