# frozen_string_literal: true

FactoryBot.define do
  factory :advisor do
    name { "MyString" }
    description { "MyText" }
    calendar { "MyString" }
    active { false }
  end
end
