require 'spec_helper'

module Spree
  module Admin
    describe StockItemsController, type: :controller do
      stub_authorization!

      context 'formats' do
        let!(:stock_item) { create(:variant).stock_items.first }

        it 'destroy stock item via js' 

      end
    end
  end
end

