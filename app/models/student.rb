class Student < User
  has_many :appointments
  has_many :checkin_records
end
