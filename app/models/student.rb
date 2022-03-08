class Student < User
  has_many :appointments
  has_many :checkins
end
