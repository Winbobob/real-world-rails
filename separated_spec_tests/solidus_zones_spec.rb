# frozen_string_literal: true

require 'spec_helper'

describe "Zones", type: :feature do
  stub_authorization!

  before(:each) do
    Spree::Zone.delete_all
    visit spree.admin_path
    click_link "Zones"
  end

  context "show" do
    it "should display existing zones" 

  end

  context "create" do
    it "should allow an admin to create a new zone" 

  end
end

