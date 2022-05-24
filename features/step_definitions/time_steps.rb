Given /^Time is freezed$/ do
  freeze_time = DateTime.parse("2022-03-08T12:00:00-08:00")
  Timecop.freeze(freeze_time)
end
