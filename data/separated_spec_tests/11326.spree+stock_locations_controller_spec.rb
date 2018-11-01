require 'spec_helper'

module Spree
  describe Api::V1::StockLocationsController, type: :controller do
    render_views

    let!(:stock_location) { create(:stock_location) }
    let!(:attributes) { [:id, :name, :address1, :address2, :city, :state_id, :state_name, :country_id, :zipcode, :phone, :active] }

    before do
      stub_authentication!
    end

    context 'as a user' do
      it 'cannot see stock locations' 


      it 'cannot see a single stock location' 


      it 'cannot create a new stock location' 


      it 'cannot update a stock location' 


      it 'cannot delete a stock location' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'gets list of stock locations' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it 'gets a stock location' 


      it 'can create a new stock location' 


      it 'can update a stock location' 


      it 'can delete a stock location' 

    end
  end
end

