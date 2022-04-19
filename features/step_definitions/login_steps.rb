Given /^(?:|I )logged in as a "([^"]*)"$/ do |user_type|
  # need to clear/delete previous created record in database before inserting
  steps %Q{
    Given I am a "#{user_type}"
    And I log in
  }
end

When /^(?:|I )am a "([^"]*)"$/ do |user_type|
  if user_type == 'Student'
    OmniAuth.config.add_mock(
      :google_oauth2,
      {
        "provider" => 'google_oauth2',
        "uid" =>      '1000000000',
        "info" =>     {
          "name" =>       'Google Test Developer',
          "email" =>      'google_test@berkeley.edu',
          "first_name" => 'Google',
          "last_name" =>  'Test Developer'
        },
        "credentials" => {
          "token" => "credentials_token_1234567",
          "refresh_token" => "credentials_refresh_token_45678"
        }
      }
    )
    u = User.new(first_name: 'Google', last_name: 'Test Developer', email: 'google_test@berkeley.edu')
    u.is_student = true
  elsif user_type == 'Admin'
    OmniAuth.config.add_mock(
      :google_oauth2,
      {
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
    )
    u = User.new(first_name: 'Google', last_name: 'Admin Developer', email: 'google_admin@berkeley.edu')
    u.is_admin = true
  elsif user_type == 'Staff'
    # pending
    u = User.new(first_name: 'Google', last_name: 'Test Developer', email: 'google_staff@berkeley.edu')
    u.is_staff = true
  end
  u.save
end

When /^(?:|I )log in$/ do
  steps %Q{
    When I am on the landing page
    When I click "Login with Google"
  }
end

And(/^I am a logged-out "([^"]*)"$/) do |user_type|
  if user_type == 'Student'
    OmniAuth.config.add_mock(
      :google_oauth2,
      {
        "provider" => 'google_oauth2',
        "uid" =>      '1000000000',
        "info" =>     {
          "name" =>       'Google Test Developer',
          "email" =>      'google_test@berkeley.edu',
          "first_name" => 'Google',
          "last_name" =>  'Test Developer'
        },
        "credentials" => {
          "token" => "credentials_token_1234567",
          "refresh_token" => "credentials_refresh_token_45678"
        }
      }
    )
  elsif user_type == 'Admin'
    OmniAuth.config.add_mock(
      :google_oauth2,
      {
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
    )
  end
end