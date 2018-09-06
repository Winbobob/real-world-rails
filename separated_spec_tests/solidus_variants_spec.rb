# frozen_string_literal: true

require 'spec_helper'

describe "Product Variants", type: :feature do
  stub_authorization!

  before(:each) do
    visit spree.admin_path
  end

  context "editing variant option types", js: true do
    let!(:product) { create(:product) }

    it "should allow an admin to create option types for a variant" 


    it "allows admin to create a variant if there are option types" 

  end
end

