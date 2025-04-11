# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe ".from_canvas" do
    let(:user_data) do
      {
        "first_name" => "John",
        "last_name" => "Doe",
        "email" => "john.doe@berkeley.edu",
        "sis_user_id" => 12345
      }
    end

    context "when user does not exist" do
      it "creates a new user with canvas data" do
        expect {
          user = User.from_canvas(user_data)
          user.save
        }.to change(User, :count).by(1)

        user = User.last
        expect(user.first_name).to eq(user_data["first_name"])
        expect(user.last_name).to eq(user_data["last_name"])
        expect(user.email).to eq(user_data["email"])
        expect(user.sid).to eq(user_data["sis_user_id"])
      end
    end

    context "when user already exists" do
      let!(:existing_user) do
        User.create!(
          first_name: "John",
          last_name: "Doe",
          email: "john.doe@berkeley.edu"
        )
      end

      it "returns the existing user without creating a new record" do
        expect {
          user = User.from_canvas(user_data)
          user.save
        }.not_to change(User, :count)

        expect(User.last).to eq(existing_user)
      end
    end

    context "with invalid data" do
      let(:invalid_data) do
        {
          "first_name" => nil,
          "last_name" => nil,
          "email" => "invalid-email",
          "sis_user_id" => 12345
        }
      end

      it "returns an invalid user object" do
        user = User.from_canvas(invalid_data)
        expect(user).not_to be_valid
        expect(user.errors[:first_name]).to include("can't be blank")
        expect(user.errors[:last_name]).to include("can't be blank")
      end
    end

    context "with missing data" do
      let(:missing_data) { {} }

      it "handles missing data gracefully" do
        user = User.from_canvas(missing_data)
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("can't be blank")
      end
    end
  end
end
