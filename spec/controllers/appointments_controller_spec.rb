require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
    describe "GET #advisors" do
      context "when not logged in" do
        it "redirects to the root path" do
          get :advisors
          expect(response).to redirect_to(root_path)
        end
        
        it "sets a flash error message" do
          get :advisors
          expect(flash[:error]).to be_present
        end
      end
    end
  end