require 'rails_helper'
include FactoryBot::Syntax::Methods

ADMIN_CREDENTIALS = {
  "provider" => 'google_oauth2',
  "uid" =>      '1000000000',
  "info" =>     {
    "name" =>       'Google Admin Developer',
    "email" =>      'google_admin@berkeley.edu',
    "first_name" => 'Google',
    "last_name" =>  'Admin Developer'
  },
  "credentials" => {
    "token" => "credentials_token_1234567",
    "refresh_token" => "credentials_refresh_token_45678"
  }
}

describe SessionsController do
  before(:each) do
    stub_const('ENV', {'ADMINS' => 'google_admin@berkeley.edu', 'STAFF' => 'google_staff@berkeley.edu'})
  end
  describe "google authentication" do
    it "should create a new user" do
      user_len = User.all.size
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      get :google_auth
      expect(User.all.size).to be user_len + 1
    end
  end
  describe "logout" do
    it "should delete session key" do
      user = FactoryBot.create(:user)
      controller.session[:current_user_id] = user.id
      get :google_auth_logout
      expect(controller.session[:current_user_id]).to be_nil
    end
  end
  describe "admin login" do
    it "should create an admin" do
      admin_len = Admin.all.size
      OmniAuth.config.add_mock(
        :google_oauth2,
        ADMIN_CREDENTIALS
      )
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      get :google_auth
      expect(Admin.all.size).to be admin_len + 1
    end
    it "should recover on empty admins" do
      stub_const('ENV', {'ADMINS' => '', 'STAFF' => 'google_staff@berkeley.edu'})
      OmniAuth.config.add_mock(
        :google_oauth2,
        ADMIN_CREDENTIALS
      )
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      get :google_auth
      expect(flash[:error]).to match(/Something went wrong, please try again later./)
    end
  end
end
