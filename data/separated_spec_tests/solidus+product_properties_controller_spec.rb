# frozen_string_literal: true

require 'spec_helper'
require 'shared_examples/protect_product_actions'

module Spree
  describe Spree::Api::ProductPropertiesController, type: :request do
    let!(:product) { create(:product) }
    let!(:property_1) { product.product_properties.create(property_name: "My Property 1", value: "my value 1", position: 0) }
    let!(:property_2) { product.product_properties.create(property_name: "My Property 2", value: "my value 2", position: 1) }

    let(:attributes) { [:id, :product_id, :property_id, :value, :property_name] }
    let(:resource_scoping) { { product_id: product.to_param } }

    before do
      stub_authentication!
    end

    context "if product is deleted" do
      before do
        product.update_column(:deleted_at, 1.day.ago)
      end

      it "can not see a list of product properties" 

    end

    it "can see a list of all product properties" 


    it "can control the page size through a parameter" 


    it 'can query the results through a parameter' 


    it "can see a single product_property" 


    it "can learn how to create a new product property" 


    it "cannot create a new product property if not an admin" 


    it "cannot update a product property" 


    it "cannot delete a product property" 


    context "as an admin" do
      sign_in_as_admin!

      it "can create a new product property" 


      it "can update a product property" 


      it "can delete a product property" 

    end

    context "with product identified by id" do
      it "can see a list of all product properties" 


      it "can see a single product_property by id" 

    end
  end
end

