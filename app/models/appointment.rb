class Appointment < ApplicationRecord
  belongs_to :staff, class_name: :User, foreign_key: :staff_id
  has_one :student
end
