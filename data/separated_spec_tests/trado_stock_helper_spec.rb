require 'rails_helper'

describe StockHelper do

    describe '#latest_stock_adjustment' do
        let!(:sku) { create(:sku, active: true) }
        let!(:stock_adjustment) { create(:stock_adjustment, sku_id: sku.id, adjusted_at: Date.yesterday, duplicate: true) }
        
        context "if the stock adjustment is equal to the latest SKU stock adjustment record" do

            it "should return a string" 

        end
        context "if the stock adjustment is not equal to the latest SKU stock adjustment record" do
            before(:each) do
                create(:stock_adjustment, sku_id: sku.id)
            end

            it "should return nil" 

        end
    end
end

