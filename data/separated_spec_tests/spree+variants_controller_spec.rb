require 'spec_helper'

module Spree
  describe Api::V1::VariantsController, type: :controller do
    render_views

    let(:option_value) { create(:option_value) }
    let!(:product) { create(:product) }
    let!(:variant) do
      variant = product.master
      variant.option_values << option_value
      variant
    end

    let!(:base_attributes) { Api::ApiHelpers.variant_attributes }
    let!(:show_attributes) { base_attributes.dup.push(:in_stock, :display_price) }
    let!(:new_attributes) { base_attributes }

    before do
      stub_authentication!
    end

    describe '#variant_includes' do
      let(:variants_includes_list) do
        [{ option_values: :option_type }, :product, :default_price, :images, { stock_items: :stock_location }]
      end

      it { expect(controller).to receive(:variant_includes).and_return(variants_includes_list) }
      after { api_get :index }
    end

    it 'adds for_currency_and_available_price_amount scope to variants list' 


    it 'can see a paginated list of variants' 


    it 'can control the page size through a parameter' 


    it 'can query the results through a parameter' 


    it 'variants returned contain option values data' 


    it 'variants returned contain images data' 


    it 'variants returned do not contain cost price data' 


    # Regression test for #2141
    context 'a deleted variant' do
      before do
        variant.update_column(:deleted_at, Time.current)
      end

      it 'is not returned in the results' 


      it 'is not returned even when show_deleted is passed' 

    end

    context 'pagination' do
      before { create(:variant) }

      it 'can select the next page of variants' 

    end

    it 'can see a single variant' 


    it 'can see a single variant with images' 


    it 'can learn how to create a new variant' 


    it 'cannot create a new variant if not an admin' 


    it 'cannot update a variant' 


    it 'cannot delete a variant' 


    context 'as an admin' do
      sign_in_as_admin!
      let(:resource_scoping) { { product_id: variant.product.to_param } }

      # Test for #2141
      context 'deleted variants' do
        before do
          variant.update_columns(deleted_at: Time.current, discontinue_on: Time.current + 1)
        end

        it 'are visible by admin' 

      end

      it 'can create a new variant' 


      it 'can update a variant' 


      it 'can delete a variant' 


      it 'variants returned contain cost price data' 

    end
  end
end

