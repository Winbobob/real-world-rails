require 'spec_helper'
require 'shared_examples/protect_product_actions'

module Spree
  describe Api::V1::ProductPropertiesController, type: :controller do
    render_views

    let!(:product) { create(:product) }
    let!(:property_1) { product.product_properties.create(property_name: 'My Property 1', value: 'my value 1', position: 0) }

    let(:attributes) { [:id, :product_id, :property_id, :value, :property_name] }
    let(:resource_scoping) { { product_id: product.to_param } }

    before do
      product.product_properties.create(property_name: 'My Property 2', value: 'my value 2', position: 1) # property_2
      stub_authentication!
    end

    context 'if product is deleted' do
      before do
        product.update_column(:deleted_at, 1.day.ago)
      end

      it 'can not see a list of product properties' 

    end

    it 'can see a list of all product properties' 


    it 'can control the page size through a parameter' 


    it 'can query the results through a parameter' 


    it 'can search for product properties' 


    it 'can see a single product_property' 


    it 'can learn how to create a new product property' 


    it 'cannot create a new product property if not an admin' 


    it 'cannot update a product property' 


    it 'cannot delete a product property' 


    context 'as an admin' do
      sign_in_as_admin!

      it 'can create a new product property' 


      context 'when product property does not exist' do
        it 'cannot update product property and responds 404' 

      end

      context 'when product property exists' do
        context 'when product property is valid' do
          it 'responds 200' 

        end

        context 'when product property is invalid' do
          before do
            expect_any_instance_of(Spree::ProductProperty).to receive(:update_attributes).and_return false
          end

          it 'responds 422' 

        end
      end

      context 'when product property does not exist' do
        it 'cannot delete product property and responds 404' 

      end

      context 'when product property exists' do
        it 'can delete a product property' 

      end
    end

    context 'with product identified by id' do
      let(:resource_scoping) { { product_id: product.id } }

      it 'can see a list of all product properties' 


      it 'can see a single product_property by id' 

    end
  end
end

