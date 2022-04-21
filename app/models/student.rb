class Student < User
  has_many :appointments
  has_many :checkins

  validates :sid, presence: true
  validate :check_is_student

  def check_is_student
    raise 'This user must be a student!!' if is_student == false
  end
end
