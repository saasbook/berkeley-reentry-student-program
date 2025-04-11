# frozen_string_literal: true

# spec/support/session_helpers.rb

module SessionHelpers
  def sign_in_as(user)
    post "/__test_login", params: { id: user.id }
  end
end

RSpec.configure do |config|
  config.include SessionHelpers, type: :request
end
