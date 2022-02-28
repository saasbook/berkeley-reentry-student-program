class Appointment < ApplicationRecord
  belongs_to :student
  belongs_to :appointment_info
  delegate :staff, to: :appointment_info
end
