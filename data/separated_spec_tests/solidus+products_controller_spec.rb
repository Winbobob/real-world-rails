# frozen_string_literal: true

require 'spec_helper'
require 'shared_examples/protect_product_actions'

module Spree
  describe Spree::Api::ProductsController, type: :request do
    let!(:product) { create(:product) }
    let!(:inactive_product) { create(:product, available_on: Time.current.tomorrow, name: "inactive") }
    let(:base_attributes) { Api::ApiHelpers.product_attributes }
    let(:show_attributes) { base_attributes.dup.push(:has_variants) }
    let(:new_attributes) { base_attributes }

    let(:product_data) do
      { name: "The Other Product",
        price: 19.99,
        shipping_category_id: create(:shipping_category).id }
    end
    let(:attributes_for_variant) do
      h = attributes_for(:variant).except(:option_values, :product)
      h.merge({
        options: [
          { name: "size", value: "small" },
          { name: "color", value: "black" }
        ]
      })
    end

    before do
      stub_authentication!
    end

    context "as a normal user" do
      context "with caching enabled" do
        let!(:product_2) { create(:product) }

        before do
          ActionController::Base.perform_caching = true
        end

        it "returns unique products" 


        after do
          ActionController::Base.perform_caching = false
        end
      end

      it "retrieves a list of products" 


      it "retrieves a list of products by id" 


      context "product has more than one price" do
        before { product.master.prices.create currency: "EUR", amount: 22 }

        it "returns distinct products only" 

      end

      it "retrieves a list of products by ids string" 


      it "does not return inactive products when queried by ids" 


      it "does not list unavailable products" 


      context "pagination" do
        it "can select the next page of products" 


        it 'can control the page size through a parameter' 

      end

      it "can search for products" 


      it "gets a single product" 


      context "tracking is disabled" do
        before { Config.track_inventory_levels = false }

        it "still displays valid json with total_on_hand Float::INFINITY" 


        after { Config.track_inventory_levels = true }
      end

      context "finds a product by slug first then by id" do
        let!(:other_product) { create(:product, slug: "these-are-not-the-droids-you-are-looking-for") }

        before do
          product.update_column(:slug, "#{other_product.id}-and-1-ways")
        end

        specify do
          get spree.api_product_path(product)
          expect(json_response["slug"]).to match(/and-1-ways/)
          product.discard

          get spree.api_product_path(other_product)
          expect(json_response["slug"]).to match(/droids/)
        end
      end

      it "cannot see inactive products" 


      it "returns a 404 error when it cannot find a product" 


      it "can learn how to create a new product" 


      it_behaves_like "modifying product actions are restricted"
    end

    context "as an admin" do
      let(:taxon_1) { create(:taxon) }
      let(:taxon_2) { create(:taxon) }

      sign_in_as_admin!

      it "can see all products" 


      # Regression test for https://github.com/spree/spree/issues/1626
      context "deleted products" do
        before do
          create(:product, deleted_at: 1.day.ago)
        end

        it "does not include deleted products" 


        it "can include deleted products" 

      end

      describe "creating a product" do
        it "can create a new product" 


        it "creates with embedded variants" 


        it "can create a new product with embedded product_properties" 


        it "can create a new product with option_types" 


        it "creates with shipping categories" 


        it "puts the created product in the given taxon" 


        # Regression test for https://github.com/spree/spree/issues/4123
        it "puts the created product in the given taxons" 


        # Regression test for https://github.com/spree/spree/issues/2140
        context "with authentication_required set to false" do
          before do
            Spree::Api::Config.requires_authentication = false
          end

          after do
            Spree::Api::Config.requires_authentication = true
          end

          it "can still create a product" 

        end

        it "cannot create a new product with invalid attributes" 

      end

      context 'updating a product' do
        it "can update a product" 


        it "can create new option types on a product" 


        it "can create new variants on a product" 


        it "can update an existing variant on a product" 


        it "cannot update a product with an invalid attribute" 


        # Regression test for https://github.com/spree/spree/issues/4123
        it "puts the created product in the given taxon" 


        # Regression test for https://github.com/spree/spree/issues/4123
        it "puts the created product in the given taxons" 

      end

      it "can delete a product" 

    end
  end
end

