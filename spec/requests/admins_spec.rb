require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admins/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view_checkin_records" do
    it "returns http success" do
      get "/admins/view_checkin_records"
      expect(response).to have_http_status(:success)
    end
  end

end
