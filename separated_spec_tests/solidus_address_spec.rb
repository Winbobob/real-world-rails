# frozen_string_literal: true

require 'spec_helper'

describe "Address", type: :feature, inaccessible: true do
  let!(:product) { create(:product, name: "RoR Mug") }
  let!(:order) { create(:order_with_totals, state: 'cart') }

  stub_authorization!

  before do
    visit spree.root_path

    click_link "RoR Mug"
    click_button "add-to-cart-button"

    address = "order_bill_address_attributes"
    @country_css = "#{address}_country_id"
    @state_select_css = "##{address}_state_id"
    @state_name_css = "##{address}_state_name"
  end

  context "country requires state", js: true, focus: true do
    let!(:canada) { create(:country, name: "Canada", states_required: true, iso: "CA") }
    let!(:uk) { create(:country, name: "United Kingdom", states_required: true, iso: "GB") }

    before { Spree::Config[:default_country_iso] = uk.iso }

    context "but has no state" do
      it "shows the state input field" 

    end

    context "and has state" do
      before { create(:state, name: "Ontario", country: canada) }

      it "shows the state collection selection" 

    end

    context "user changes to country without states required" do
      let!(:france) { create(:country, name: "France", states_required: false, iso: "FR") }

      it "clears the state name" 

    end
  end

  context "country does not require state", js: true do
    let!(:france) { create(:country, name: "France", states_required: false, iso: "FR") }

    it "shows a disabled state input field" 

  end
end
