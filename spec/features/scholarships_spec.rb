# spec/features/scholarships_spec.rb

require 'rails_helper'

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

RSpec.feature "Scholarships", type: :feature do

  scenario "user can view scholarships index page" do
    visit root_path
    click_button "Login with Google"
    # expect(page).to have_button("Login with Google")
    expect(page).to have_link("Re-entry Scholarships", href: scholarships_path)
    click_link "Re-entry Scholarships"
    expect(current_path).to eq(scholarships_path)
  end
end