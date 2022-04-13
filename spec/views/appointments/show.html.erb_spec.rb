require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
