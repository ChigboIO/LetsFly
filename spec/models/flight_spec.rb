require "rails_helper"

RSpec.describe Flight, type: :model do
  it "has a valid factory" do
    expect(build(:flight)).to be_valid
  end

  let(:flight) { build(:flight) }

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

    # it { expect(airport).to allow_value("Muhammed Airport").for(:name) }
    # it { expect(airport).to allow_value("Lagos").for(:state) }
  end

  describe "ActiveModel Association" do
    it { expect(flight).to have_many(:bookings) }
    it { expect(flight).to have_many(:passengers).through(:bookings) }
    it { expect(flight).to belong_to(:origin_airport).class_name(:Airport) }
    it do
      expect(flight).to belong_to(:destination_airport).class_name(:Airport)
    end
  end
end
