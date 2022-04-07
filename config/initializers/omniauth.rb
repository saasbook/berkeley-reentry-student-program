# frozen_string_literal: true

def omniauth_google_mock
  {
      provider: 'google_oauth2',
      uid:      '100000000000000000000',
      info:     {
          name:       'Google Test Developer',
          email:      'google_test@example.com',
          first_name: 'Google',
          last_name:  'Test Developer'
      },
      credentials: {
        token: "credentials_token_123456",
        refresh_token: "credentials_refresh_token_456789"
      }
  }
end

def setup_omniauth_mocks
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(
      :google_oauth2,
      omniauth_google_mock
  )
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  setup_omniauth_mocks unless Rails.env.production?
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
OmniAuth.config.allowed_request_methods = %i[post]