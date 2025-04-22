# frozen_string_literal: true

require "capybara"
require "selenium-webdriver"

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")  # Runs Chrome in headless mode (no UI)
  options.add_argument("--disable-gpu")  # Optional: to prevent GPU acceleration issues
  options.add_argument("--window-size=1280x1024")  # Optional: specify window size to avoid rendering issues
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Before("@selenium") do
  Capybara.current_driver = :selenium_chrome
  WebMock.disable!
end

After("@selenium") do
  Capybara.use_default_driver
  WebMock.enable!
end
