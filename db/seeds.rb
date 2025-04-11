# frozen_string_literal: true

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
FactoryBot.create(:admin)

10.times do
  students.push FactoryBot.create(:student)
  # create 10 students and save them
end

3.times do
  staffs.push FactoryBot.create(:staff)
end

checkin_reasons = ["Peer Support", "Counseling Appointment", "Studying", "OWLs Meeting", "Other"]
40.times do
  FactoryBot.create(:checkin, reason: checkin_reasons.sample, student: students.sample,
                              time: Time.current + r.rand(-240.hours..0.hours))
end

20.times do
  FactoryBot.create(:appointment, staff: staffs.sample, student: students.sample,
                                  time: Time.current + r.rand(-240.hours..240.hours))
end

10.times do
  FactoryBot.create(:appointment, staff: staffs.sample, student: nil, time: Time.current + r.rand(1.hours..240.hours))
end

puts "Seeding Scholarships..."

# Clear existing scholarships if needed (be careful with this in production)
# Scholarship.destroy_all

Scholarship.find_or_create_by!(name: "Crankstart Re-entry Scholarship") do |s|
  s.description = <<-DESC.strip_heredoc
      <p>The Crankstart Re-entry Scholarship provides up to $5,000 awards to ten first-semester#{' '}
      (if you began taking courses during summer, you may still apply) undergraduate re-entry students#{' '}
      who demonstrate the potential and capacity to positively contribute to society beyond Berkeley.#{'  '}
      <b>The Crankstart Re-entry Scholarship has closed for the 2024-2025 cycle.</b>
      </p>
      <p>Applicants must meet the following criteria:
        <ul>
          <li>Be a UC Berkeley re-entry student above the age of 25</li>
          <li>Be an Undergraduate pursuing their first baccalaureate degree</li>
          <li>Be in their first full semester at UC Berkeley (those who began over the summer are also eligible)</li>
          <li>Anticipate workforce participation for a significant period of time subsequent to graduation#{' '}
          (those planning on attending graduate school before the workforce are also eligible)</li>
          <li>Have filed a FAFSA and be eligible to receive financial aid (Dream aid included)</li>
          <li>Hold a minimum cumulative grade point average of 3.0 from all colleges attended</li>
        </ul>
      </p>
      <p>Your application must include:#{' '}
        <ol>
          <li>A personal essay no more than three pages double-spaced (with one inch margins in Times New Roman font)#{' '}
          that describes what it means to be a re-entry student. In your essay please: share your interest and values,#{' '}
          highlight your personal achievements through your work, school, family or community service in spite of obstacles,#{' '}
          explain how your leadership and perseverance made a difference, address the interruption to your college academics,#{' '}
          and share your educational and career goals. </li>
          <li>Copies of transcripts from all colleges attended (unofficial accepted)</li>
          <li>No more than 2 letters of recommendation (can be from, for example, a former instructor,#{' '}
              supervisor, or mentor who can speak to your ability to apply your Berkeley education to future#{' '}
              contributions to society)</li>
        </ol>
      </p>#{'  '}
  DESC
  s.status_text = "The 2024 Crankstart Re-entry Scholarship has closed for the 2024-2025 cycle."
  # You might want to leave the URL blank initially or set it to a placeholder if the real form isn't ready
  s.application_url = "https://docs.google.com/forms/d/e/1FAIpQLSfQlLgXMMbFPkaicu1szFYGFedH6EyDGY7xMnAKZnI_pdecow/closedform" # Example URL
end

Scholarship.find_or_create_by!(name: "Osher Re-entry Scholarship") do |s|
  s.description = <<-DESC.strip_heredoc
    <p>The Osher Re-entry Scholarship Program awards several continuing (completed at least one fall or spring semester at Berkeley)#{' '}
          undergraduate re-entry students who demonstrate the potential and capacity to positively contribute to society#{' '}
          beyond Berkeley with awards up to $5,000 for the academic year. <b>The Osher Re-entry Scholarship has closed for the 2024-2025 cycle.</b>
          </p>
          <p>Applicants must meet the following criteria:
            <ul>
              <li>Be a UC Berkeley re-entry student above the age of 25</li>
              <li>Be an Undergraduate pursuing their first baccalaureate degree</li>
              <li>Have completed at least one fall or spring semester at UC Berkeley</li>
              <li>Anticipate workforce participation for a significant period of time subsequent to graduation</li>
              <li>Have filed a FAFSA and be eligible to receive financial aid (Dream aid included)</li>
              <li>Hold a minimum cumulative grade point average of 3.0 from all colleges attended</li>
            </ul>
          </p>
          <p>Your application must include:#{' '}
            <ol>
              <li>A personal essay no more than 3 pages double-spaced (with one inch margins in Times New Roman font) that describes#{' '}
              what it means to be a re-entry student. In your essay please: share your interest and values, highlight your personal#{' '}
              achievements through your work, school, family or community service in spite of obstacles, explain how your leadership and#{' '}
              perseverance made a difference, address the interruption to your college academics, and share your educational#{' '}
              and career goals. </li>
              <li>Copies of transcripts from all colleges attended (unofficial accepted)</li>
              <li>No more than 2 letters of recommendation* (can be from, for example, a former instructor, supervisor or mentor#{' '}
                  who can speak to your ability to apply your Berkeley education to future contributions to society)</li>
            </ol>
          </p>
  DESC
  s.status_text = "The 2024 Osher Re-entry Scholarship has closed for the 2024-2025 cycle."
  s.application_url = "https://forms.gle/xakufqTN2Gsu5vur9" # Example URL
end

puts "Finished seeding Scholarships."
