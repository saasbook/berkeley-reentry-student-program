# frozen_string_literal: true

# spec/features/courses_spec.rb

require "rails_helper"

STUDENT_CREDENTIALS = {
  "provider" => "google_oauth2",
  "uid" => "1000000000",
  "info" => {
    "name" => "Google Test Developer",
    "email" => "google_student@berkeley.edu",
    "first_name" => "Google",
    "last_name" => "Test Developer"
  },
  "credentials" => {
    "token" => "credentials_token_1234567",
    "refresh_token" => "credentials_refresh_token_45678"
  }
}

RSpec.feature "Courses", type: :feature do
  before do
    OmniAuth.config.add_mock(
      :google_oauth2,
      STUDENT_CREDENTIALS
    )
    @student = FactoryBot.create :student, email: "google_student@berkeley.edu"
  end

  scenario "user can view courses index page" do
    visit root_path
    click_button "Login with Google"
    expect(page).to have_link("Our Courses", href: courses_path)
    click_link "Our Courses"

    # This checks that we've reached the courses page by its title
    expect(page).to have_content("Courses")

    # This checks that we either see courses or the "no courses" message
    expect(page).to satisfy do |p|
      p.has_css?(".card-header") ||
      p.has_content?("No courses are currently available")
    end

    expect(current_path).to eq(courses_path)
  end
end
