require "rails_helper"

RSpec.describe Passenger, type: :model do
  let(:passenger) { Passenger.new }
  subject { passenger }

  it { should respond_to(:booking_id) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:phone) }
end
