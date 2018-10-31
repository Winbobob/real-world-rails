require 'rails_helper'

describe AccessoriesController do

    store_setting

    describe 'GET #update' do
        let(:product) { create(:product_sku) }
        let(:accessory) { create(:accessory) }
        before(:each) do
            create(:accessorisation, product: product, accessory: accessory)
        end
        it "should return a 200 status code" 

    end  
end

