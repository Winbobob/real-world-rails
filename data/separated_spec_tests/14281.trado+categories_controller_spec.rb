require 'rails_helper'

describe CategoriesController do

    store_setting

    describe 'GET #show' do
        let(:category) { create(:category) }
        before(:each) do
            create(:product_sku_attachment, category_id: category.id)
        end

        it "should assign the requested category to @category" 

        it "should render the :show template" 

    end

end

