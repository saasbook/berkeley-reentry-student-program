FactoryBot.define do
  factory :announcement do
    issued_date { "2022-02-28" }
    title { "MyString" }
    content { "MyString" }
    admin { nil }
  end
end
