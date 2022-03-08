class Student < User
  has_many :appointments
  has_many :checkin_records

  validates :sid, presence: true
  validate :check_is_student

  def check_is_student
    if is_student == false
      raise "This user must be a student!!"
    end
  end

  def checkin
    Time.zone = 'Pacific Time (US & Canada)'
    CheckinRecord.create(time: DateTime.now, student: self)
  end
end
