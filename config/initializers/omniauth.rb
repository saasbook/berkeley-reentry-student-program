Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.production?
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
      :google_oauth2,
      {
        "provider" => 'google_oauth2',
        "uid" =>      '100000000000000000000',
        "info" =>     {
          "name" =>       'Google Test Developer',
          "email" =>      'google_test@example.com',
          "first_name" => 'Google',
          "last_name" =>  'Test Developer'
        },
        "credentials" => {
          "token" => "credentials_token_1234567",
          "refresh_token" => "credentials_refresh_token_45678"
        }
      }
    )
  end
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
OmniAuth.config.allowed_request_methods = %i[post]