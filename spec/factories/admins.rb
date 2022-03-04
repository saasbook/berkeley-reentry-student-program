FactoryBot.define do
  factory :admin, parent: :user do
    sequence(:first_name) { |n| "Admin_first#{n}" }
    is_student { false }
    is_admin { true }
  end
end
