require 'rails_helper'
include FactoryBot::Syntax::Methods

describe SessionsController do
  describe "google authentication" do
    it "should create a new user" do
      user_len = User.all.size
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      get :googleAuth
      expect(User.all.size).to be user_len + 1
    end
  end
end
