FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "User_first#{n}" }
    sequence(:last_name) { |n| "User_last#{n}" }
    sequence(:email) { |n| "User#{n}@berkeley.edu" }
    sid { nil }
    is_student { true }
    is_admin { false }
    is_staff { false }
  end
end
