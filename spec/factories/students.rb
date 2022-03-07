FactoryBot.define do
  factory :student, parent: :user, class: :student do
    sequence(:first_name) { |n| "Student_first#{n}" }
    sequence(:sid) { |n| 3031234567 + n }
  end
end
