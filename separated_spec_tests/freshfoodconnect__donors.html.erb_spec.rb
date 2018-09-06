require "rails_helper"
require "clearance/rspec"

describe "users/_donors" do
  it "displays donor information" 


  context "when the donor is also an admin" do
    it "hides the promote button" 

  end

  def have_promote_button
    have_css("[data-role=promote]")
  end

  def build_donor(name:, address:, zipcode:, admin: false)
    location = build(:location, address: address, zipcode: zipcode)

    build_stubbed(:user, name: name, location: location, admin: admin)
  end
end

