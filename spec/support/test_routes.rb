# frozen_string_literal: true

# spec/support/test_routes.rb

if Rails.env.test? && !Rails.application.routes.named_routes.key?(:__test_login)
  Rails.application.routes.append do
    post "__test_login", to: ->(env) {
      req = ActionDispatch::Request.new(env)
      req.session[:current_user_id] = req.params["id"]
      [200, { "Content-Type" => "text/plain" }, ["Logged in"]]
    }
  end

  Rails.application.reload_routes!
end
