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

Given /^I have appointments in "([^"]+)" hours$/ do |hours_string|
  hours = hours_string.split(", ")
  hours.each do |h|
    steps %Q{
      Given I have an appointment in "#{h}" hours
    }
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

Given /^I had an appointment "([^"]+)" hours ago$/ do |h|
  steps %Q{
    Given I have an appointment in "-#{h}" hours
  }
end

Given /^I had appointments "([^"]+)" hours ago$/ do |hours_string|
  hours = hours_string.split(", ")
  hours.each do |h|
    steps %Q{
      Given I had an appointment "#{h}" hours ago
    }
  end
end

Given /^I had no past appointment$/ do
  user = User.where(email: 'google_test@berkeley.edu').first
  if user.is_student
    user = Student.find_by_id(user.id)
  else
    user = staff.find_by_id(user.id)
  end
  user.past_appts.delete_all
end

Then /^I should see an appointment in "([^"]+)" hours ago under past appointments section$/ do |h|
  expected_appt_time = (Time.current - h.to_i.hours).strftime("%Y-%m-%d %H:%M")
  expect(page.body).to match /(Past Appointments).*#{expected_appt_time}/m
end

Then /^I should see appointments in "([^"]+)" hours ago under past appointments section$/ do |hours_string|
  # sort hours in ascending order e.g. "10, 100, 20, 30" => ["10", "20", "30", "100"]
  hours = hours_string.split(", ").sort{|a, b| a.to_i <=> b.to_i}
  (1...hours.size).each do |i|
    h1 = (Time.current - hours[i - 1].to_i.hours).strftime("%Y-%m-%d %H:%M")
    h2 = (Time.current - hours[i].to_i.hours).strftime("%Y-%m-%d %H:%M")
    expect(page.body).to match /(Past Appointments).*#{h1}.*#{h2}/m
  end
end
