class Checkin < ApplicationRecord
  validates :time, :student_id, :reason, :presence => true
  belongs_to :student
end
