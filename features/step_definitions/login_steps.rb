Given /^(?:|I )logged in as a "([^"]*)"$/ do |user_type|
  # make a new user with user_type
  u = User.new(first_name: 'Google', last_name: 'Test Developer', email: 'google_test@example.com')
  if user_type == 'Student'
    u.is_student = true
  elsif user_type == 'Admin'
    u.is_admin = true
  elsif user_type == 'Staff'
    u.is_staff = true
  end
  u.save

  # mock token so it finds the user we just created
  post 'auth/google_oauth2'
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