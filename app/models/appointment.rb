# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :staff
  belongs_to :student, optional: true
end
