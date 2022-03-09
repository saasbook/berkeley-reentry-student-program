require 'rails_helper'
include FactoryBot::Syntax::Methods

RSpec.describe Student, type: :model do
  
  it "checks if student have sid before saving" do
    n_student = build :student
    n_student.sid = nil
    expect{n_student.save!}.to raise_error
    
  end

  it "doesn't allows non student user to be saved as student" do
    n_student = build :student
    n_student.is_student = false
    expect{n_student.save!}.to raise_error(Exception, "This user must be a student!!")
  end

  describe 'checks-in' do
    before do
      @student = create :student
      @expected_time = DateTime.parse("2022-03-08T12:00:00-08:00")
      allow(DateTime).to receive(:now).and_return @expected_time
      @student.checkin
      @cr = CheckinRecord.find_by student: @student
    end
    
    it "should save a checkin record in database" do
      expect(!!@cr).to be true
    end

    describe "the new checkin record should" do
      it "contains the current time" do
        expect(@cr.time).to eq @expected_time
      end

      it "contains student who create it" do
        expect(@cr.student).to eq @student
      end
    end   
    
    
  end
end
