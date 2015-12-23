require "rails_helper"

RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    expect(build(:booking)).to be_valid
  end

  let(:booking) { build(:booking) }

  describe "instance metods" do
    context "respond to instance method calls" do
      it { expect(booking).to respond_to(:flight_id) }
      it { expect(booking).to respond_to(:user_id) }
      it { expect(booking).to respond_to(:booking_number) }
      it { expect(booking).to respond_to(:amount) }
      it { expect(booking).to respond_to(:paid) }
    end

    # context "#name_with_state" do
    #   it "combines airport name and state" do
    #     expect(airport.name_with_state).to eq("JJC Airport, Lagos")
    #   end
    # end
  end

  describe "ActiveModel Validation" do
    it { expect(booking).to validate_presence_of(:flight_id) }
    it { expect(booking).to validate_presence_of(:booking_number) }
    it { expect(booking).to validate_presence_of(:amount) }

    # it { expect(booking).to allow_value("Muhammed Airport").for(:name) }
    # it { expect(booking).to allow_value("Lagos").for(:state) }
  end

  describe "ActiveModel Association" do
    it { expect(booking).to belong_to(:flight) }
  end
end
