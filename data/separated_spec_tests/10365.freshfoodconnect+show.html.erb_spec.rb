require "rails_helper"

describe "profiles/show" do
  it "displays profile information" 


  context "when there isn't a current donation" do
    it "informs the User there won't be a donation" 

  end

  def have_selected(value)
    have_css %{[checked][value="#{value}"]}
  end

  def have_unscheduled_donation_text
    have_text t("unscheduled_donations.unscheduled_donation.text")
  end

  before do
    view.signed_in = true
  end
end

