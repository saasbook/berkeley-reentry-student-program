# frozen_string_literal: true

When(/^(?:|I )click "Submit" in checkin$/) do
  @n_checkin_before = Checkin.all.size
  click_link_or_button('Submit')
end

Then(/^no checkin record should be created$/) do
  n_checkin_after = Checkin.all.size
  expect(n_checkin_after).to eq @n_checkin_before
end
