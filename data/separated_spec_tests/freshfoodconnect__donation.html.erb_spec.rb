require "rails_helper"

describe "donations/donation" do
  context "when the donation is pending" do
    it "hides additional information" 

  end

  context "when the donation is confirmed" do
    it "displays additional information" 

  end

  context "when the donation is declined" do
    it "hides additional information" 

  end

  def expect_rendered_not_to_have_information
    expect(rendered).not_to have_role("donation-size")
    expect(rendered).not_to have_role("donation-notes")
  end

  def have_edit_link_for(donation)
    have_css(%{a[href="#{edit_donation_path(donation)}"]})
  end

  def have_enabled_button(type)
    have_css("button:not([disabled])", text: t("donations.#{type}.text"))
  end

  def have_role(role)
    have_css(%{[data-role="#{role}"]})
  end
end

