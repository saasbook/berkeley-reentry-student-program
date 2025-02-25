# spec/features/scholarships_spec.rb

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

RSpec.feature "Scholarships", type: :feature do
    before do
        OmniAuth.config.add_mock(
            :google_oauth2,
            STUDENT_CREDENTIALS
        )
        @student = FactoryBot.create :student, email: 'google_student@berkeley.edu'
    end
    scenario "user can view scholsarships index page" do
        visit root_path
        click_button "Login with Google"
        expect(page).to have_link("Re-entry Scholarships", href: scholarships_path)
        click_link "Re-entry Scholarships"
        expect(page).to have_content("Awards")
        expect(current_path).to eq(scholarships_path)
    end
end