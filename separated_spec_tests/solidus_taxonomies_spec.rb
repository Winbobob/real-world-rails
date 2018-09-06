# frozen_string_literal: true

require 'spec_helper'

describe "Taxonomies", type: :feature do
  stub_authorization!

  before(:each) do
    visit spree.admin_path
    click_link "Settings"
  end

  context "show" do
    it "should display existing taxonomies" 

  end

  context "create" do
    before(:each) do
      click_nav "Products", "Taxonomies"
      click_link "admin_new_taxonomy_link"
    end

    it "should allow an admin to create a new taxonomy" 


    it "should display validation errors" 

  end

  context "edit" do
    it "should allow an admin to update an existing taxonomy" 

  end
end

