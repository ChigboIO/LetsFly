require "rails_helper"

RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    expect(build(:booking)).to be_valid
  end

  let(:booking) { build(:booking) }
  let(:flight) { build(:flight) }
  let(:passenger) { build(:passenger) }

  before do
    flight.save
    booking.flight_id = flight.id
    booking.save
    passenger.booking_id = booking.id
    passenger.save
  end

  describe "instance metods" do
    context "respond to instance method calls" do
      it { expect(booking).to respond_to(:flight_id) }
      it { expect(booking).to respond_to(:user_id) }
      it { expect(booking).to respond_to(:booking_number) }
      it { expect(booking).to respond_to(:amount) }
      it { expect(booking).to respond_to(:paid) }
      it { expect(booking).to respond_to(:user_or_passenger) }
      it { expect(booking).to respond_to(:remaining_seats) }
      it { expect(booking).to respond_to(:release_seats) }
    end
  end

  describe "ActiveModel Validation" do
    it { expect(booking).to validate_presence_of(:flight_id) }
  end

  describe "ActiveModel Association" do
    it { expect(booking).to belong_to(:flight) }
    it { expect(booking).to have_many(:passengers) }
    it { expect(booking).to belong_to(:user) }
  end

  describe "Nested Attribute Acceptance" do
    it { expect(booking).to accept_nested_attributes_for(:passengers) }
  end

  describe "Connected Models" do
    it { expect(booking.flight).to be_a(Flight) }
    it { expect(booking.passengers.first).to be_a(Passenger) }
  end

  describe "#user_or_passenger" do
    it "returns the first passenger" do
      expect(booking.user_or_passenger).to eq(passenger)
    end
  end

  describe "#remaining_seats" do
    it "return the number of available seats" do
      expect(booking.remaining_seats).to eq(79)
    end
  end

  describe "#release_seats" do
    it "releases the flight's booked seats and destroys the booking" do
      booking.release_seats
      expect(flight.available_seats).to eq(80)
      expect(booking).to be_valid
    end
  end
end
