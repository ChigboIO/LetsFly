require "rails_helper"

RSpec.describe Passenger, type: :model do
  it "has a valid factory" do
    expect(build(:passenger)).to be_valid
  end

  let(:passenger) { build(:passenger) }

  describe "instance metods" do
    context "respond to instance method calls" do
      it { expect(passenger).to respond_to(:booking_id) }
      it { expect(passenger).to respond_to(:name) }
      it { expect(passenger).to respond_to(:email) }
      it { expect(passenger).to respond_to(:phone) }
    end
  end

  describe "ActiveModel Validation" do
    it { expect(passenger).to validate_presence_of(:name) }

    it { expect(passenger).to allow_value("Emmanuel Chigbo").for(:name) }
    it do
      expect(passenger).to allow_value("emmanuel.chigbo@andela.com").for(:email)
    end
    it do
      expect(passenger).not_to allow_value("emmanuel.chigbo@andela").for(:email)
    end
    it { expect(passenger).not_to allow_value("emmanuel.chigbo").for(:email) }
    it { expect(passenger).not_to allow_value("@.").for(:email) }
  end

  describe "ActiveModel Association" do
    it { expect(passenger).to belong_to(:booking) }
  end
end
