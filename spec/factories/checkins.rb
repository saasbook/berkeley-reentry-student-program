FactoryBot.define do
  factory :checkin do
    Time.zone = 'Pacific Time (US & Canada)'
    time { Time.now }
    first_name {'Jane'}
    last_name {'Doe'}
    student_id { 123456789 }
    email {'janedoe@berkeley.edu'}
    association :student, factory: :student
  end
end
