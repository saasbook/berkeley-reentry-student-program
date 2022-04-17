Given /^I have an appointment in "([^"]+)" hours$/ do |h|
  user = User.where(email: 'google_test@berkeley.edu').first
  if user.is_student
    student = Student.find_by_id(user.id)
    FactoryBot.create(:appointment, time: Time.current + h.to_i.hours, student: student)
  else
    staff = staff.find_by_id(user.id)
    FactoryBot.create(:appointment, time: Time.current + h.to_i.hours, staff: staff)
  end
end

Given /^I have no upcoming appointment$/ do
  user = User.where(email: 'google_test@berkeley.edu').first
  if user.is_student
    user = Student.find_by_id(user.id)
  else
    user = staff.find_by_id(user.id)
  end
  user.upcoming_appts.delete_all
end

Then /^I should see an appointment in "([^"]+)" hours under upcoming appointments section$/ do |h|
  expected_appt_time = (Time.current + h.to_i.hours).strftime("%Y-%m-%d %H:%M")
  expect(page.body).to match /(Upcoming Appointments).*#{expected_appt_time}.*(Past Appointments)/m
end