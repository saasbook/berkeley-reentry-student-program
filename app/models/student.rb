class Student < User
  has_many :appointments
  has_many :checkins

  validates :sid, presence: true
  validate :check_is_student

  def check_is_student
    if is_student == false
      raise "This user must be a student!!"
    end
  end

  def upcoming_appts
    appointments.where("time >= ?", Time.current).order(time: :desc)
  end

  def past_appts
    appointments.where("time < ?", Time.current).order(time: :desc)
  end

end
