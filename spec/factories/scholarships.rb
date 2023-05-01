# frozen_string_literal: true

FactoryBot.define do
    factory :scholarship do
      Time.zone = 'Pacific Time (US & Canada)'
      time { Time.now }
      association :student, factory: :student
    end
  end