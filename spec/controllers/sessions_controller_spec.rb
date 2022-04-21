# frozen_string_literal: true

require 'rails_helper'
include FactoryBot::Syntax::Methods

describe SessionsController do
  describe 'google authentication' do
    it 'should create a new user' do
      user_len = User.all.size
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      get :google_auth
      expect(User.all.size).to be user_len + 1
    end
  end
  describe 'logout' do
    it 'should delete session key' do
      user = FactoryBot.create(:user)
      controller.session[:current_user_id] = user.id
      get :google_auth_logout
      expect(controller.session[:current_user_id]).to be_nil
    end
  end
end
