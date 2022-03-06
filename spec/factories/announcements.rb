FactoryBot.define do
  factory :announcement do
    Time.zone = 'Pacific Time (US & Canada)'
    sequence(:title) { |n| "Announcement #{n} Title" }
    sequence(:content) { |n| "Announcement #{n} content" }
    issued_date { DateTime.now.to_date }
    association :admin, factory: :admin
  end
end
