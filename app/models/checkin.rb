class Checkin < ApplicationRecord
  validates :time, :student_id, :reason, :presence => true
  belongs_to :student

  # get the 20 checkin records start from index 20*n (sorted by time)
  def self.get_20_checkin_records n
    from_index = n >= 0 ? 20 * n : 0
    records = Checkin.all.order(time: :desc)[from_index, 20] || []
    records
  end

  def self.reasons
    ['Peer Support', 'Counseling Appointment', 'Studying', 'OWLs Meeting', 'Other']
  end
end
