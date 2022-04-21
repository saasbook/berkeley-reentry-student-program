FactoryBot.define do
  factory :student, parent: :user, class: :Student do
    sequence(:first_name) { |n| "Student_first#{n}" }
    sequence(:sid) { |n| 3_031_234_567 + n }
  end
end
