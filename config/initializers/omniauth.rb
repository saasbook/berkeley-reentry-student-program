# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.production?
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      :google_oauth2,
      {
        "provider" => "google_oauth2",
        "uid" => "1000000000",
        "info" => {
          "name" => "Google Test Developer",
          "email" => "google_test@berkeley.edu",
          "first_name" => "Google",
          "last_name" => "Test Developer"
        },
        "credentials" => {
          "token" => "credentials_token_1234567",
          "refresh_token" => "credentials_refresh_token_45678"
        }
      }
    )
    OmniAuth.config.add_mock(
      :oauth2,
      {
        "provider" => "oauth2",
        "uid" => "1000000000",
        "info" => {
          "name" => "Canvas Test Developer",
          "email" => "canvas_test@berkeley.edu",
          "first_name" => "Canvas",
          "last_name" => "Test Developer"
        },
        "credentials" => {
          "token" => "mock_canvas_token_123456",
          "refresh_token" => "mock_canvas_refresh_token_45678"
        }
      }
    )
  end
  provider :google_oauth2, Rails.application.credentials[:GOOGLE_CLIENT_ID], Rails.application.credentials[:GOOGLE_CLIENT_SECRET]
  provider :oauth2, Rails.application.credentials[:CANVAS_CLIENT_ID], Rails.application.credentials[:CANVAS_CLIENT_SECRET],
    client_options: {
      site: Rails.application.credentials[:CANVAS_URL],
      authorize_url: "/login/oauth2/auth",
      token_url: "/login/oauth2/token"
    }
end
OmniAuth.config.allowed_request_methods = %i[post]
