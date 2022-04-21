class Appointment < ApplicationRecord
  belongs_to :staff
  belongs_to :student, optional: true
end
