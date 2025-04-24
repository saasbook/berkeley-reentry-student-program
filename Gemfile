# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.7"


# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.1"

gem "pg"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets", "~> 3.7.2"
gem "sprockets-rails"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
# gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

gem "figaro"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails"
# Bootstrap
gem "bootstrap", "~> 5.0.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use for Google Oauth 2.0
gem "omniauth-google-oauth2"

# Use for Canvas authentication
gem "omniauth"
gem "omniauth-oauth2"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.10.1"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"
# Gemfile
gem "omniauth-rails_csrf_protection"
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

# Use for New Relic APM
gem "newrelic_rpm"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "byebug"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "guard-rspec"
  gem "rspec-rails", "~> 4.1.2"
  gem "sqlite3", "~>1.7.0" # is this ok?
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "~> 4.2.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :linters do
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "~> 3.0"
  gem "cucumber", "~> 3.2.0"
  gem "cucumber-rails", "~> 2.6.1", require: false
  gem "cucumber-rails-training-wheels" # basic imperative step defs like "Then I should see..."
  gem "database_cleaner", "~> 1.8.5" # required by Cucumber
  gem "rails-controller-testing", github: "rails/rails-controller-testing"
  gem "selenium-webdriver"
  gem "simplecov", "~> 0.22.0", require: false
  gem "simplecov-html", "~> 0.13.1", require: false
  gem "simplecov_json_formatter", "~> 0.1.4", require: false
  gem "docile", "~> 1.4", ">= 1.4.1", require: false
  gem "timecop"
  gem "webdrivers"
  gem "webmock"
  gem "axe-core-rspec"
  gem "axe-core-cucumber"
end
