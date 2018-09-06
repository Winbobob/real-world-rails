# frozen_string_literal: true

require 'spec_helper'

describe "Store", type: :feature, js: true do
  stub_authorization!

  let!(:store) do
    create(:store, name: 'Test Store', url: 'test.example.org',
           mail_from_address: 'test@example.org')
  end

  let!(:vat_country) { create(:country, iso: "DE", name: "Germany") }

  before(:each) do
    visit spree.admin_path
    click_link "Settings"
    within('.admin-nav') do
      click_link "Stores"
    end
  end

  context "visiting general store settings" do
    it "should have the right content" 

  end

  context "editing general store settings" do
    it "should be able to update the site name" 


    it "should be able to update the default cart tax country" 

  end

  context "update fails" do
    it "should display the error" 

  end
end

