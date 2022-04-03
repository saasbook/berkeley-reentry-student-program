source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem 'actionpack', "= 6.1.4"

gem 'activesupport', "= 6.1.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 6.1.4"

gem 'pg'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
gem "sprockets", "~> 3.7.2"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
#gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
#gem "stimulus-rails"
# Bootstrap
gem 'bootstrap', '~> 5.0.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'


# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.10.1"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3'
  gem 'factory_bot_rails'
  gem 'rspec-rails', "~> 4.1.2"
  gem 'guard-rspec'
  gem 'byebug'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "~> 3.7.0"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'simplecov', '~> 0.21.2', :require => false
  gem 'simplecov_json_formatter', '~> 0.1.2', :require => false
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'cucumber', '~> 3.0.0'
  gem 'cucumber-rails', '~> 1.7.0', :require => false
  gem 'capybara', '~> 3.0'
  gem 'cucumber-rails-training-wheels' # basic imperative step defs like "Then I should see..."
  gem 'database_cleaner', "~> 1.8.5" # required by Cucumber
<<<<<<< HEAD
  gem 'rails-controller-testing' 
=======
  gem 'rails-controller-testing'
  gem 'timecop'
>>>>>>> main
end