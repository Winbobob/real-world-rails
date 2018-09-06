require 'spec_helper'

describe 'Tax Rates', type: :feature do
  stub_authorization!

  before { create(:tax_rate, calculator: stub_model(Spree::Calculator)) }

  # Regression test for #1422
  it 'can create a new tax rate' 

end

