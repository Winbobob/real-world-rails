# frozen_string_literal: true

require 'spec_helper'

describe "Stock Locations", type: :feature do
  stub_authorization!

  before(:each) do
    create(:country)
    visit spree.admin_path
    click_link "Settings"
    click_link "Shipping"
    click_link "Stock Locations"
  end

  it "can create a new stock location" 


  it "can delete an existing stock location", js: true do
    create(:stock_location)
    visit current_path

    expect(find('#listing_stock_locations')).to have_content("NY Warehouse")
    accept_alert do
      click_icon :trash
    end

    expect(page).to have_content('Stock Location "NY Warehouse" has been successfully removed')

    visit current_path
    expect(page).to have_content("No Stock Locations found")
  end

  it "can update an existing stock location" 

end

