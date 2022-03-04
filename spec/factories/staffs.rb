FactoryBot.define do
  factory :staff, parent: :user do
    sequence(:first_name) { |n| "Staff_first#{n}" }
    is_student { false }
    is_staff { true }
  end
end
