# frozen_string_literal: true

require "rails_helper"

RSpec.describe Advisor, type: :model do
  it "is valid with valid attributes" do
    advisor = Advisor.new(name: "John Doe", description: "Test description", calendar: "https://example.com", active: true)
    expect(advisor).to be_valid
  end

  it "is invalid without a name" do
    advisor = Advisor.new(description: "Test description", calendar: "https://example.com", active: true)
    expect(advisor).not_to be_valid
  end

  it "is invalid with an invalid calendar link" do
    advisor = Advisor.new(name: "John Doe", description: "Test description", calendar: "invalid-url", active: true)
    expect(advisor).not_to be_valid
  end
end
