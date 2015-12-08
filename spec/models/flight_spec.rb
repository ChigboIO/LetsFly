require "rails_helper"

RSpec.describe Flight, type: :model do
  let(:flight) { Flight.new }
  subject { flight }

  it { should respond_to(:airline) }
  it { should respond_to(:origin_airport_id) }
  it { should respond_to(:destination_airport_id) }
  it { should respond_to(:departure_datetime) }
  it { should respond_to(:arrival_datetime) }
  it { should respond_to(:capacity) }
  it { should respond_to(:available_seats) }
end
