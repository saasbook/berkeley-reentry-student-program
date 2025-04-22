# frozen_string_literal: true

# spec/requests/checkin_spec.rb

require "rails_helper"

RSpec.describe "Checkin", type: :request do
  let(:student)        { FactoryBot.create(:student) }
  let(:expected_time)  { DateTime.parse("2022-03-08T12:00:00-08:00") }

  before do
    Timecop.freeze(expected_time)
  end

  after do
    Timecop.return
  end

  describe "POST /checkin" do
    context "when user is logged in" do
      before do
        sign_in_as(student)
        @n_checkin_before = Checkin.count
      end

      context "happy path" do
        before do
          post checkin_path, params: { checkin: { reason: "Studying" } }
          @new_checkin = Checkin.order(id: :desc).first
        end

        it "adds 1 new checkin record" do
          expect(Checkin.count).to eq(@n_checkin_before + 1)
        end

        it "creates a checkin record with the correct time" do
          expect(@new_checkin.time).to eq(expected_time)
        end

        it "associates the new checkin with the logged-in student" do
          expect(@new_checkin.student).to eq(student)
        end

        it "clears the flash when creating a new checkin" do
          get new_checkin_path
          expect(flash).to be_empty
        end
      end

      context "sad path" do
        it "redirects to root if the record is invalid" do
          post checkin_path, params: { checkin: { reason: nil } }
          expect(response).to redirect_to(root_path)
          expect(flash[:error]).to match(/Something went wrong, please try again/)
        end
      end
    end

    context "when user is not logged in" do
      it "redirects to the root path" do
        post checkin_path, params: { checkin: { reason: "Studying" } }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET /checkin/new (autofill functionality)" do
    context "when user has no previous check-ins" do
      before do
        sign_in_as(student)
        get new_checkin_path
      end

      it "sets default_reason to 'Peer Support'" do
        expect(assigns(:default_reason)).to eq("Peer Support")
      end
    end

    context "when user has previous check-ins" do
      before do
        sign_in_as(student)
        Checkin.create!(student: student, reason: "Studying", time: Time.current)
        get new_checkin_path
      end

      it "sets default_reason to the last used reason" do
        expect(assigns(:default_reason)).to eq("Studying")
      end
    end
  end
end
