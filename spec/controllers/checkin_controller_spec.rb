require 'rails_helper'
include FactoryBot::Syntax::Methods

describe CheckinController do
  before do
    # set precondition: sessions, datetime, checkin records
    @stu = create :student
    @expected_time = DateTime.parse("2022-03-08T12:00:00-08:00")
    allow(DateTime).to receive(:now).and_return @expected_time
    controller.session[:current_user_id] = @stu.id
    controller.params[:checkin] = {:reason => "Studying"}
  end

  describe "POST create" do
    before do
      @n_checkin_before = Checkin.all.size
      get :new
      post :create
      @new_checkin = Checkin.order(id: :desc).first
    end

    it "should add 1 new checkin record to the table" do
      expect(Checkin.all.size).to eq(@n_checkin_before + 1)
    end

    it "should create a checkin record with correct time" do
      expect(@new_checkin.time).to eq(@expected_time)
    end

    it "the new checkin record should belongs to the student in session" do
      expect(@new_checkin.student).to eq(@stu)
    end

  end
end