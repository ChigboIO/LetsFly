require "rails_helper"

RSpec.describe Flight, type: :model do
  it "has a valid factory" do
    expect(build(:flight)).to be_valid
  end

  let(:flight) { build(:flight) }
  let(:airport1) { build(:airport) }
  let(:airport2) { Airport.new(name: "Dominus Airport", state: "Enugu") }

  before do
    airport1.save
    airport2.save
    flight.origin_airport_id = airport1.id
    flight.destination_airport_id = airport2.id
    flight.save
  end

  describe "instance methods" do
    context "respond to instance method calls" do
      it { expect(flight).to respond_to(:airline) }
      it { expect(flight).to respond_to(:origin_airport_id) }
      it { expect(flight).to respond_to(:destination_airport_id) }
      it { expect(flight).to respond_to(:departure_datetime) }
      it { expect(flight).to respond_to(:arrival_datetime) }
      it { expect(flight).to respond_to(:capacity) }
      it { expect(flight).to respond_to(:available_seats) }
      it { expect(flight).to respond_to(:price) }
      it { expect(flight).to respond_to(:flight_no) }
      it { expect(Flight).to respond_to(:get_match) }
      it { expect(Flight).to respond_to(:not_departed) }
      it { expect(Flight).to respond_to(:coming_from) }
      it { expect(Flight).to respond_to(:going_to) }
      it { expect(Flight).to respond_to(:has_enough_seats) }
      it { expect(Flight).to respond_to(:takeoff_on) }
    end
  end

  describe "ActiveModel Validation" do
    it { expect(flight).to validate_presence_of(:airline) }
    it { expect(flight).to validate_presence_of(:flight_no) }
    it { expect(flight).to validate_presence_of(:origin_airport_id) }
    it { expect(flight).to validate_presence_of(:destination_airport_id) }
    it { expect(flight).to validate_presence_of(:departure_datetime) }
    it { expect(flight).to validate_presence_of(:arrival_datetime) }
    it { expect(flight).to validate_presence_of(:capacity) }
    it { expect(flight).to validate_presence_of(:available_seats) }
    it { expect(flight).to validate_presence_of(:price) }
  end

  describe "ActiveModel Association" do
    it { expect(flight).to have_many(:bookings) }
    it { expect(flight).to have_many(:passengers).through(:bookings) }
    it { expect(flight).to belong_to(:origin_airport).class_name(:Airport) }
    it do
      expect(flight).to belong_to(:destination_airport).class_name(:Airport)
    end
  end

  describe "Connected Models" do
    it { expect(flight.origin_airport).to be_a(Airport) }
    it { expect(flight.destination_airport).to be_a(Airport) }
  end

  describe ".get_match" do
    it "returns the flight that matches the search" do
      match = Flight.get_match(
        origin_airport_id: flight.origin_airport.id,
        destination_airport_id: flight.destination_airport.id,
        available_seats: "1",
        departure_datetime: ""
      ).first
      expect(match).to eq(flight)
    end
  end

  describe "Model scopes" do
    it do
      expect(Flight.not_departed.first).to eq(
        Flight.where("departure_datetime > ?", Time.now).first
      )
    end
    it do
      expect(Flight.coming_from(flight.id).first).to eq(
        Flight.where("origin_airport_id > ?", flight.id).first
      )
    end
    it do
      expect(Flight.going_to(flight.id).first).to eq(
        Flight.where("destination_airport_id > ?", flight.id).first
      )
    end
    it do
      expect(Flight.has_enough_seats(flight.available_seats).first).to eq(
        Flight.where("available_seats >= ?", flight.available_seats).first
      )
    end
    it do
      expect(Flight.takeoff_on(flight.departure_datetime.to_s).first).to eq(
        Flight.where(
          "Date(departure_datetime) = ?",
          Date.parse(flight.departure_datetime.to_s).strftime("%Y-%m-%d")
        ).first
      )
    end
  end
end
