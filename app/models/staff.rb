# frozen_string_literal: true

class Staff < User
  has_many :appointments
end
