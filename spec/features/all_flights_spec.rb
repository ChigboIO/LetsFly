require "rails_helper"

RSpec.describe "All Flights", type: :feature do
  describe "GET /flight" do
    it "should contain 'Let's fly" do
      visit root_path
      click_link "All Flight"
      expect(page).to have_content("Let's fly")
      expect(page).to have_content("Flight Time Board")
      expect(page).to have_selector("tr", maximum: 31)
    end
  end
end
