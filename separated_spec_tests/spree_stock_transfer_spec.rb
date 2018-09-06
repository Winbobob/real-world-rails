require 'spec_helper'

describe 'Stock Transfers', type: :feature, js: true do
  stub_authorization!

  it 'shows variants with options text' 


  it 'transfer between 2 locations' 


  describe 'received stock transfer' do
    def it_is_received_stock_transfer(page)
      expect(page).to have_content('Reference PO 666')
      expect(page).not_to have_selector('#stock-location-source')
      expect(page).to have_selector('#stock-location-destination')

      transfer = Spree::StockTransfer.last
      expect(transfer.stock_movements.size).to eq 1
      expect(transfer.source_location).to be_nil
    end

    it 'receive stock to a single location' 


    it 'forced to only receive there is only one location' 

  end
end

