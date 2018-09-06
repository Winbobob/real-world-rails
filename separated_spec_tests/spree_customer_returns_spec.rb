require 'spec_helper'

describe 'Customer Returns', type: :feature do
  stub_authorization!
  let!(:customer_return) { create(:customer_return, created_at: Time.current) }

  describe 'listing' do
    let!(:customer_return_2) { create(:customer_return, created_at: Time.current - 1.day) }

    before do
      visit spree.admin_customer_returns_path
    end

    it 'lists sorted by created_at' 


    it 'displays pre tax total' 


    it 'displays order number' 


    it 'displays customer return number' 


    it 'displays status' 


    it 'has edit link' 

  end

  describe 'searching' do
    let!(:customer_return_2) { create(:customer_return) }

    it 'searches on number' 

  end

  describe 'link' do
    describe 'order number' do
      it 'opens orders edit page' 

    end

    describe 'customer return number' do
      it 'opens customer return edit page' 

    end
  end
end

