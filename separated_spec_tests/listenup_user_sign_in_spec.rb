require 'rails_helper'

feature "user signs in", %q{
  As a User
  I want to sign in
  So that I can be identified on the website by other Users
} do

  # Acceptance Criteria
  #
  # - I must provide my email and password
  # - I see an error message if I do not provide valid credentials

  scenario "user signs in with valid credentials" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content "Signed in successfully."
  end

  scenario "user signs in with invalid credentials" do
    visit new_user_session_path
    click_button "sign in"

    expect(page).to have_content "Invalid email or password."
  end
end

