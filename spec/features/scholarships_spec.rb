# spec/features/scholarships_spec.rb

require 'rails_helper'

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