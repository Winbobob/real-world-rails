require 'spec_helper'

module Spree
  describe Admin::StockTransfersController, type: :controller do
    stub_authorization!

    let!(:stock_transfer1) do
      StockTransfer.create do |transfer|
        transfer.source_location_id = 1
        transfer.destination_location_id = 2
        transfer.reference = 'PO 666'
      end end

    let!(:stock_transfer2) do
      StockTransfer.create do |transfer|
        transfer.source_location_id = 3
        transfer.destination_location_id = 4
        transfer.reference = 'PO 666'
      end end

    context '#index' do
      it 'gets all transfers without search criteria' 


      it 'searches by source location' 


      it 'searches by destination location' 

    end
  end
end

