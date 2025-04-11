# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
    end
  end

  def self.from_canvas(user_data)
    where(email: user_data["email"]).first_or_initialize do |user|
      user.first_name = user_data["first_name"]
      user.last_name = user_data["last_name"]
      user.email = user_data["email"]
      user.sid = user_data["sis_user_id"]
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end
