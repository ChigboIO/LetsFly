require "rails_helper"

RSpec.describe "LandingPages", type: :feature do
  describe "GET /" do
    it "should contain 'Let's fly" do
      visit root_path
      expect(page).to have_content("Let's fly")
    end

    scenario "search section" do
      visit root_path
      within(:css, "div.search-form-section") do
        expect(page).to have_selector("select", count: 2)
        expect(page).to have_selector("input", count: 3)
      end
    end

    scenario "Flight board" do
      visit root_path
      within("div#flight-time-board") do
        expect(page).to have_selector("tr", maximum: 11)
        # expect(page).to have_content("No flight found for your search.")
      end
    end

    scenario "booking a flight" do
      visit root_path
      within("div#flight-time-board") do
        # expect(page).to have_selector()
        click_link "book", match: :first
        # expect(current_path).to eq()
      end
      expect(page).to have_content("Passengers Details")
      expect(page).to have_content("Flight Details")
      within("div#passengers") do
        # expect(page).to have_selector("input", count: 3)
        fill_in "booking_passengers_attributes_0_name", with: "Emmanuel"
        fill_in(
          "booking_passengers_attributes_0_email",
          with: "emmanuel@gmail.com"
        )
        fill_in "booking_passengers_attributes_0_phone", with: "08137141280"
      end
      click_button "Proceed to Checkout"
      expect(page).to have_content("Passengers")
      expect(page).to have_content("Make Payment")
      within("div#passengers") do
        expect(page).to have_selector("tr", minimum: 1)
        expect(page).to have_content("Emmanuel")
        expect(page).to have_content("emmanuel@gmail.com")
        expect(page).to have_content("08137141280")
      end
      click_link "Make Payment"
      expect(page).to have_content("Thank You")
      expect(page).to have_content("FROM")
      expect(page).to have_content("TO")
      expect(page).to have_content("Booking Number")
      expect(page).to have_content("Passengers")
      expect(page).to have_selector("tr", minimum: 1)
    end
  end
end
