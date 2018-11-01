require 'spec_helper'

module Spree
  describe Api::V1::StockItemsController, type: :controller do
    render_views

    let!(:stock_location) { create(:stock_location_with_items) }
    let!(:stock_item) { stock_location.stock_items.order(:id).first }
    let!(:attributes) { [:id, :count_on_hand, :backorderable, :stock_location_id, :variant_id] }

    before do
      stub_authentication!
      stock_item.update(backorderable: true)
    end

    context 'as a normal user' do
      it 'cannot list stock items for a stock location' 


      it 'cannot see a stock item' 


      it 'cannot create a stock item' 


      it 'cannot update a stock item' 


      it 'cannot destroy a stock item' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'cannot list of stock items' 


      it 'requires a stock_location_id to be passed as a parameter' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter (count_on_hand)' 


      it 'can query the results through a paramter (variant_id)' 


      it 'gets a stock item' 


      it 'can create a new stock item' 


      it 'can update a stock item to add new inventory' 


      it 'can update a stock item to modify its backorderable field' 


      it 'can set a stock item to modify the current inventory' 


      it 'can delete a stock item' 

    end
  end
end

