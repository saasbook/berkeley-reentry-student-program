# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'checks if student have sid before saving' do
    n_student = FactoryBot.build :student
    n_student.sid = nil
    expect { n_student.save! }.to raise_error
  end

  it "doesn't allows non student user to be saved as student" do
    n_student = FactoryBot.build :student
    n_student.is_student = false
    expect { n_student.save! }.to raise_error(Exception, 'This user must be a student!!')
  end

  describe 'appointments' do
    before do
      @expected_time = DateTime.parse('2022-03-08T12:00:00-08:00')
      Timecop.freeze(@expected_time)
      @stu = create :student
      @staff = create :staff
      @past_appointments = []
      @upcoming_appointments = []
      (-5...0).each do |i|
        appt = create :appointment, time: Time.current + i.days, student: @stu, staff: @staff
        @past_appointments.push(appt)
      end
      (1..5).each do |i|
        appt = create :appointment, time: Time.current + i.days, student: @stu, staff: @staff
        @upcoming_appointments.push(appt)
      end
    end

    it 'upcoming_appts should return all upcoming appointments in sorted order (time, descending)' do
      expect(@stu.upcoming_appts).to eq(@upcoming_appointments.sort { |a, b| b.time <=> a.time })
    end

    it 'past_appts should return all past appointments in sorted order (time, descending)' do
      expect(@stu.past_appts).to eq @past_appointments.sort { |a, b| b.time <=> a.time }
    end
  end
end
