# frozen_string_literal: true

# test/models/event_test.rb
require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "should validate presence of required fields" do
    event = Event.new
    assert_not event.valid?
    assert_includes event.errors[:title], "can't be blank"
    assert_includes event.errors[:date], "can't be blank"
    assert_includes event.errors[:start_time], "can't be blank"
    assert_includes event.errors[:location], "can't be blank"
    assert_includes event.errors[:description], "can't be blank"
  end

  test "should be valid with all required fields" do
    event = Event.new(
      title: "Career Workshop",
      date: Date.today,
      start_time: Time.now,
      location: "MLK Student Union",
      description: "Learn resume skills"
    )
    assert event.valid?
  end

  test "formatted_date should return readable date" do
    event = Event.new(date: Date.new(2025, 4, 15))
    assert_equal "Tuesday, April 15, 2025", event.formatted_date
  end

  test "formatted_time should handle missing end_time" do
    event = Event.new(start_time: Time.new(2025, 1, 1, 14, 0, 0))
    assert_equal "2:00 PM", event.formatted_time
  end

  test "formatted_time should include range when end_time present" do
    event = Event.new(
      start_time: Time.new(2025, 1, 1, 14, 0, 0),
      end_time: Time.new(2025, 1, 1, 16, 0, 0)
    )
    assert_equal "2:00 PM - 4:00 PM", event.formatted_time
  end
end
