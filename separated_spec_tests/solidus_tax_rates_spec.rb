# frozen_string_literal: true

require 'spec_helper'

describe "Tax Rates", type: :feature do
  stub_authorization!

  let!(:tax_rate) { create(:tax_rate, calculator: stub_model(Spree::Calculator)) }

  before do
    visit spree.admin_path
    click_link "Taxes"
  end

  # Regression test for https://github.com/spree/spree/issues/535
  it "can see a tax rate in the list if the tax category has been deleted" 


  # Regression test for https://github.com/spree/spree/issues/1422
  it "can create a new tax rate" 

end

