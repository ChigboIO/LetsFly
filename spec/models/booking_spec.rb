require "rails_helper"

RSpec.describe Booking, type: :model do
  let(:booking) { Booking.new }
  subject { booking }

  it { should respond_to(:passenger_id) }
  it { should respond_to(:flight_id) }
end
