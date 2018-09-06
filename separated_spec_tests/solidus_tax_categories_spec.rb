# frozen_string_literal: true

require 'spec_helper'

describe "Tax Categories", type: :feature do
  stub_authorization!

  before(:each) do
    visit spree.admin_path
    click_link "Taxes"
  end

  context "admin visiting tax categories list" do
    it "should display the existing tax categories" 

  end

  context "admin creating new tax category" do
    before(:each) do
      click_link "Tax Categories"
      click_link "admin_new_tax_categories_link"
    end

    it "should be able to create new tax category" 


    it "should show validation errors if there are any" 

  end

  context "admin editing a tax category" do
    it "should be able to update an existing tax category" 

  end
end

