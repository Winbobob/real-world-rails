require 'spec_helper'

module Spree
  describe Api::V1::StockMovementsController, type: :controller do
    render_views

    let!(:stock_location) { create(:stock_location_with_items) }
    let!(:stock_item) { stock_location.stock_items.order(:id).first }
    let!(:stock_movement) { create(:stock_movement, stock_item: stock_item) }
    let!(:attributes) { [:id, :quantity, :stock_item_id] }

    before do
      stub_authentication!
    end

    context 'as a user' do
      it 'cannot see a list of stock movements' 


      it 'cannot see a stock movement' 


      it 'cannot create a stock movement' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'gets list of stock movements' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it 'gets a stock movement' 


      it 'can create a new stock movement' 

    end
  end
end

