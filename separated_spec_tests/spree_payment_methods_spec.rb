require 'spec_helper'

describe 'Payment Methods', type: :feature do
  stub_authorization!

  before do
    visit spree.admin_payment_methods_path
  end

  context 'admin visiting payment methods listing page' do
    it 'displays existing payment methods' 

  end

  context 'admin creating a new payment method' do
    it 'is able to create a new payment method' 

  end

  context 'admin editing a payment method', js: true do
    before do
      create(:check_payment_method)
      visit current_path

      within('table#listing_payment_methods') do
        click_icon(:edit)
      end
    end

    it 'is able to edit an existing payment method' 


    it 'displays validation errors' 

  end
end

