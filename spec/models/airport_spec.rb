require "rails_helper"

RSpec.describe Airport, type: :model do
  it "is a valid factory" do
    expect(build(:airport)).to be_valid
  end

  let(:airport) { build(:airport) }

  describe "instance metods" do
    context "respond to instance method calls" do
      it { expect(airport).to respond_to(:name) }
      it { expect(airport).to respond_to(:state) }
    end

    context "#name_with_state" do
      it "combines airport name and state" do
        expect(airport.decorate.name_with_state).to eq("JJC Airport, Lagos")
      end
    end
  end

  describe "ActiveModel Validation" do
    it { expect(airport).to validate_presence_of(:name) }
    it { expect(airport).to validate_presence_of(:state) }

    it { expect(airport).to allow_value("Muhammed Airport").for(:name) }
    it { expect(airport).to allow_value("Lagos").for(:state) }
  end

  describe "ActiveModel Association" do
    it do
      expect(airport).to have_many(:flights).
        with_foreign_key(:origin_airport_id)
    end
  end
end
