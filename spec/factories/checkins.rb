FactoryBot.define do
  factory :checkin do
    Time.zone = 'Pacific Time (US & Canada)'
    time { Time.now }
    association :student, factory: :student
  end
end
