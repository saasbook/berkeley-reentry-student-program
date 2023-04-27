require 'rails_helper'

STUDENT_CREDENTIALS = {
  'provider' => 'google_oauth2',
  'uid' => '1000000000',
  'info' => {
    'name' => 'Google Test Developer',
    'email' => 'google_student@berkeley.edu',
    'first_name' => 'Google',
    'last_name' => 'Test Developer'
  },
  'credentials' => {
    'token' => 'credentials_token_1234567',
    'refresh_token' => 'credentials_refresh_token_45678'
  }
}

RSpec.describe PodcastsController, type: :controller do
  describe "GET #index" do
    context "when not logged in" do
      it "redirects to the root path" do
        get :index
        expect(response).to redirect_to(root_path)
      end
      
      it "sets a flash error message" do
        get :index
        expect(flash[:error]).to be_present
      end
    end
  end
end
