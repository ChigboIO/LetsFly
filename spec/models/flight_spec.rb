require "rails_helper"

RSpec.describe Flight, type: :model do
  let(:flight) { Flight.new }
  subject { flight }

  it { should respond_to(:airline) }
  it { should respond_to(:airport_id) }
  it { should respond_to(:departure) }
  it { should respond_to(:duration) }
  it { should respond_to(:capacity) }
  it { should respond_to(:available_seats) }
end
