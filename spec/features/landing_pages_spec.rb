require "rails_helper"

RSpec.describe "LandingPages", type: :feature do
  describe "GET /" do
    it "should contain Sass test" do
      visit root_path
      expect(page).to have_content("Let's fly")
    end
  end
end
