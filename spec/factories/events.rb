# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { "MyString" }
    date { "2025-04-03" }
    start_time { "2025-04-03 14:54:29" }
    end_time { "2025-04-03 14:54:29" }
    location { "MyString" }
    description { "MyText" }
  end
end
