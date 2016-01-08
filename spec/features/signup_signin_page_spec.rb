require "rails_helper"

RSpec.describe "Signup and Signin Pages", type: :feature do
  before(:all) do
    User.destroy_all
  end

  context "Signup" do
    context "When coming from home page" do
      scenario "page has content 'SIgn Up form'" do
        visit root_path
        within(:css, "ul.top-nav") do
          click_link "signup"
        end
        expect(page).to have_current_path(signup_path)
        expect(page).to have_content("Sign Up form")
      end
    end

    context "When filling the signup form" do
      before(:each) do
        visit signup_path
      end

      scenario "with valid email and password" do
        sign_up_with "Emmanuel", "valid@example.com", "password"

        expect(current_path).to eq(root_path)
        expect(page).to have_content("Emmanuel")
        # expect(page).to have_content("logout")
        expect(page).to have_no_content("signup")
        expect(page).to have_no_content("signin")
        # byebug
      end

      scenario "with invalid email" do
        sign_up_with "Emmanuel", "invalid_email@example", "password"

        expect(page).to have_content("Sign Up form")

        within(:css, "div.error-messages") do
          expect(page).to have_content("Some error occured")
          expect(page).to have_content("Email is invalid")
        end
      end

      scenario "with blank fields" do
        sign_up_with "", "", ""
        expect(page).to have_content("Sign Up form")

        within(:css, "div.error-messages") do
          expect(page).to have_content("Name can't be blank")
          expect(page).to have_content("Email can't be blank")
          expect(page).to have_content("Email is invalid")
          expect(page).to have_content("Password can't be blank")
        end
      end

      def sign_up_with(name, email, password)
        fill_in "user_name", with: name
        fill_in "user_email", with: email
        fill_in "user_password", with: password
        fill_in "user_password_confirmation", with: password
        click_button "Signup"
      end
    end
  end

  context "Signin Page" do
    context "When coming from home page" do
      scenario "page has content 'Login form'" do
        visit root_path
        within(:css, "ul.top-nav") do
          expect(page).to have_selector(:link_or_button, "signin")
          click_link "signin"
        end
        expect(page).to have_current_path(login_path)
        expect(page).to have_content("Login form")
      end
    end

    context "When filling the signin form" do
      before(:each) do
        visit login_path
      end

      scenario "with valid email and password" do
        sign_in_with("valid@example.com", "password")

        # expect(page).to have_current_path(root_path)
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Emmanuel")
        # expect(page).to have_content("logout")
        expect(page).to have_no_content("signup")
        expect(page).to have_no_content("signin")
      end

      scenario "with invalid email" do
        sign_in_with "no_user@example.com", "password"

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Incorrect username or password")
      end

      def sign_in_with(email, password)
        fill_in "email", with: email
        fill_in "password", with: password
        click_button "Signin"
      end
    end
  end
end
