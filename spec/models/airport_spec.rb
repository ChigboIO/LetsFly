require "rails_helper"

RSpec.describe Airport, type: :model do
  let(:airport) { Airport.new }
  subject { airport }

  it { should respond_to(:name) }
  it { should respond_to(:state) }

  it "has a valid factory" do
    # Using the shortened version of FactoryGirl syntax.
    # Add:  "config.include FactoryGirl::Syntax::Methods"
    # (no quotes) to your spec_helper.rb
    # expect(build(:factory_you_built)).to be_valid
  end
end
