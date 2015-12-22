require "rails_helper"

RSpec.describe User, type: :model do
  it "is a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  context "when it's instance methods are called" do
    it { expect(user).to respond_to(:name) }
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password_digest) }
  end

  describe "ActiveModel validation" do
    it { expect(user).to validate_presence_of(:name) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }

    it { expect(user).to allow_value("Emmanuel Chigbo").for(:name) }
    it { expect(user).to allow_value("emmanuel.chigbo@andela.com").for(:email) }
    it { expect(user).not_to allow_value("emmanuel.chigbo@andela").for(:email) }
    it { expect(user).not_to allow_value("emmanuel.chigbo").for(:email) }
    it { expect(user).not_to allow_value("@.").for(:email) }
  end

  describe "ActiveModel Association" do
    it { expect(user).to have_many(:bookings) }
  end
end
