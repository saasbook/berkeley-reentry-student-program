Given /^(?:|I )logged in as a "([^"]*)"$/ do |user_type|
  # need to clear/delete previous created record in database before inserting
  steps %Q{
    When I am a "#{user_type}"
    When I am on the landing page
    When I click "Login with Google"
  }
end

When /^(?:|I )am a "([^"]*)"$/ do |user_type|
  u = User.new(first_name: 'Google', last_name: 'Test Developer', email: 'google_test@example.com')
  if user_type == 'Student'
    u.is_student = true
  elsif user_type == 'Admin'
    u.is_admin = true
  elsif user_type == 'Staff'
    u.is_staff = true
  end
  u.save
end