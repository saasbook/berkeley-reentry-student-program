# frozen_string_literal: true

When(/^(?:|I )click "([^"]*)"$/) do |bol|
  click_link_or_button(bol)
end

Then(/^(?:|I )should got "([^"]*)"$/) do |text|
  expect(page).to have_selector(:link_or_button, text)
end

Then(/^(?:|I )should not got "([^"]*)"$/) do |text|
  expect(page).not_to have_selector(:link_or_button, text)
end
