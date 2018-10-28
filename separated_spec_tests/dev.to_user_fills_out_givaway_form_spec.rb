require "rails_helper"

describe "Freestickers giveaway (wind-down)" do
  let(:user) { create(:user, onboarding_package_requested: true) }
  let(:success_message) { "Your stickers should arrive soon" }
  let(:error_messages) do
    [
      "You need a shipping name",
      "You need a shipping address",
      "You need a shipping city",
      "You need a shipping country",
      "You need to include your favorite languages. It's a spam filter.",
    ]
  end

  def fill_form
    fill_in "Name (for shipping)", with: user.name
    fill_in "Company (for shipping if applicable)", with: "what"
    fill_in "Address", with: "is"
    fill_in "Address Line 2", with: "this"
    fill_in "City", with: "New York"
    fill_in "State/Province", with: "NY"
    select "Canada", from: "Country"
    fill_in "Zip Number/Postal Code", with: "10036"
    fill_in "Favorite programming languages", with: "JavaScript"
    fill_in "Specialty (web development, sysadmin, etc.)", with: "Software Developer"
  end

  before { login_as(user) }

  it "user fills out giveaway form correctly" 


  it "user fills out giveaway form incorrectly" 


  it "user already filled out the re-request giveaway form" 

end

