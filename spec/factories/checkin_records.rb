FactoryBot.define do
  factory :checkin_record do
    time { Time.now }
    association :student, factory: :student
  end
end
