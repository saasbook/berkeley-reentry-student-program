# frozen_string_literal: true

ADMIN_CREDENTIALS = {
  'provider' => 'google_oauth2',
  'uid' => '1000000000',
  'info' => {
    'name' => 'Google Admin Developer',
    'email' => 'google_admin@berkeley.edu',
    'first_name' => 'Google',
    'last_name' => 'Admin Developer'
  },
  'credentials' => {
    'token' => 'credentials_token_1234567',
    'refresh_token' => 'credentials_refresh_token_45678'
  }
}.freeze

STUDENT_CREDENTIALS = {
  'provider' => 'google_oauth2',
  'uid' => '1000000000',
  'info' => {
    'name' => 'Google Test Developer',
    'email' => 'google_test@berkeley.edu',
    'first_name' => 'Google',
    'last_name' => 'Test Developer'
  },
  'credentials' => {
    'token' => 'credentials_token_1234567',
    'refresh_token' => 'credentials_refresh_token_45678'
  }
}.freeze

Given(/^(?:|I )logged in as a "([^"]*)"$/) do |user_type|
  # need to clear/delete previous created record in database before inserting
  steps %(
    Given I am a "#{user_type}"
    And I log in
  )
end

When(/^(?:|I )am a "([^"]*)"$/) do |user_type|
  case user_type
  when 'Student'
    OmniAuth.config.add_mock(
      :google_oauth2,
      STUDENT_CREDENTIALS
    )
    u = User.new(first_name: 'Google', last_name: 'Test Developer', email: 'google_test@berkeley.edu')
    u.is_student = true
  when 'Admin'
    OmniAuth.config.add_mock(
      :google_oauth2,
      ADMIN_CREDENTIALS
    )
    u = User.new(first_name: 'Google', last_name: 'Admin Developer', email: 'google_admin@berkeley.edu')
    u.is_admin = true
  when 'Staff'
    # pending
    u = User.new(first_name: 'Google', last_name: 'Test Developer', email: 'google_staff@berkeley.edu')
    u.is_staff = true
  end
  u.save
end

When(/^(?:|I )log in$/) do
  steps %(
    When I am on the landing page
    When I click "Login with Google"
  )
end

And(/^I am a logged-out "([^"]*)"$/) do |user_type|
  case user_type
  when 'Student'
    OmniAuth.config.add_mock(
      :google_oauth2,
      STUDENT_CREDENTIALS
    )
  when 'Admin'
    OmniAuth.config.add_mock(
      :google_oauth2,
      ADMIN_CREDENTIALS
    )
  end
end
