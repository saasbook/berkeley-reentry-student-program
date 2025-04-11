# frozen_string_literal: true

When(/^I click "Submit" in checkin$/) do
  @checkins_before = Checkin.count
  click_button "Submit"
end

Then(/^the checkin should be successful$/) do
  expect(Checkin.count).to eq(@checkins_before + 1)
  expect(page).to have_content("Success!")
end

Given(/^I have previously checked in for "([^"]*)"$/) do |reason|
  # Make sure we're using the same user from login
  @user = Student.find(Capybara.current_session.driver.request.session["current_user_id"])
  @user.checkins.create!(
    reason: reason,
    time: Time.current
  )
end

Then(/^the reason dropdown should show "([^"]*)"$/) do |expected_reason|
  expect(page).to have_select("checkin_reason", selected: expected_reason)
end
