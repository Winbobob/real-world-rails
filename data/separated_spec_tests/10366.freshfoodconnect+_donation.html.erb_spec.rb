require "rails_helper"

describe "scheduled_pickups/donation" do
  it "displays Donation information" 


  context "when the Donation is pending" do
    it "is displayed as 'Unconfirmed'" 

  end

  def have_pickup_status_text(status)
    have_text t("pickups.statuses.#{status}")
  end
end

