# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

r = Random.new
students = []
staffs = []
admin = FactoryBot.create(:admin)

10.times do
  students.push FactoryBot.create(:student)
  # create 10 students and save them
end

3.times do
  staffs.push FactoryBot.create(:staff)
end

checkin_reasons = ['Peer Support', 'Counseling Appointment', 'Studying', 'OWLs Meeting', 'Other']
40.times do
  FactoryBot.create(:checkin, reason: checkin_reasons.sample, student: students.sample, time: Time.current + r.rand(-240.hours..0.hours))
end

20.times do
  FactoryBot.create(:appointment, staff: staffs.sample, student: students.sample, time: Time.current + r.rand(-240.hours..240.hours))
end

10.times do
  FactoryBot.create(:appointment, staff: staffs.sample, student: nil, time: Time.current + r.rand(1.hours..240.hours))
end

