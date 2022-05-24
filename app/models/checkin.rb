# frozen_string_literal: true

class Checkin < ApplicationRecord
  validates :time, :student_id, :reason, presence: true
  belongs_to :student

  def self.reasons
    ['Peer Support', 'Counseling Appointment', 'Studying', 'OWLs Meeting', 'Other']
  end
end
