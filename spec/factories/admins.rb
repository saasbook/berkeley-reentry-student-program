# frozen_string_literal: true

FactoryBot.define do
  factory :admin, parent: :user, class: :admin do
    sequence(:first_name) { |n| "Admin_first#{n}" }
    is_student { false }
    is_admin { true }
  end
end
