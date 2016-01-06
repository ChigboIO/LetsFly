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
        expect(page).to have_selector("input", count: 2)
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
      within(:css, "div#flight-time-board") do
        expect(page).to have_selector(:link_or_button, "book")
        # click_link "book", match: :first
        first(:link_or_button, "book").click
        # expect(current_path).to eq()
      end
      expect(page).to have_selector("input", minimum: 3)
      expect(page).to have_content("Passengers Details")
      expect(page).to have_content("Flight Details")
      within(:css, "div#passengers") do
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
      expect(page).to have_selector(:link_or_button, "Make Payment")
      within(:css, "div#passengers") do
        expect(page).to have_selector("tr", minimum: 1)
        expect(page).to have_content("Emmanuel")
        expect(page).to have_content("emmanuel@gmail.com")
        expect(page).to have_content("08137141280")
      end

      # click_link "Make Payment"

      # #Now in the paypal page
      # expect(page).to have_content("test facilitator's Test Store")
      # expect(page).to have_content("Your order summary")
      # expect(page).to have_selector(:button, "Pay with my PayPal account")
      # click_button "Pay with my PayPal account"
      # expect(page).to have_selector("input", minimum: 2)

      # fill_in "Email", with: "chigboemmanuel-buyer@gmail.com"
      # fill_in "PayPal password", with: "1234567890"
      # click_button "Log In"
      # save_and_open_page

      # expect(page).to have_selector(:link_or_button, "Pay Now")
      # expect(page).to have_content("Review your information")
      # expect(page).to have_content("chigboemmanuel-buyer@gmail.com")
      # click "Pay Now", match: :first

      # expect(page).to have_content("Thanks for your order")
      # click_button "Return to test facilitator's Test Store"

      booking = Booking.last
      visit payment_bookings_path(booking.id)
      # save_and_open_page

      expect(page).to have_selector(:link_or_button, "Print")
      expect(page).to have_selector(:link_or_button, "Close")
      expect(page).to have_content("Thank You")
      expect(page).to have_content("FROM")
      expect(page).to have_content("TO")
      expect(page).to have_content("Booking Number")
      expect(page).to have_content("Passengers")
      expect(page).to have_selector("tr", minimum: 1)
    end
  end

  describe "Manage booking" do
    scenario "Manage Booking" do
      booking = Booking.last
      passenger = booking.passengers.first

      visit root_path
      click_link "Manage Bookings"
      expect(page).to have_selector("input")
      expect(page).to have_selector(:button, "Search")

      fill_in "booking_number", with: booking.booking_number
      click_button "Search"

      expect(page).to have_selector("input[value='#{passenger.name}']")
      expect(page).to have_selector("input[value='#{passenger.email}']")
      expect(page).to have_selector("input[value='#{passenger.phone}']")
      expect(page).to have_selector(:button, "Update")
      expect(page).to have_content("Passengers Details")
      expect(page).to have_content("Flight Details")

      # update passenger
      fill_in "booking_passengers_attributes_0_phone", with: "08072772485"
      click_button "Update"

      expect(page).to have_selector("input[value='08072772485']")
    end
  end
end
