# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::VariantsController, type: :request do
    let!(:product) { create(:product) }
    let!(:variant) do
      variant = product.master
      variant.option_values << create(:option_value)
      variant
    end

    let!(:base_attributes) { Api::ApiHelpers.variant_attributes }
    let!(:show_attributes) { base_attributes.dup.push(:in_stock, :display_price, :variant_properties) }
    let!(:new_attributes) { base_attributes }

    before do
      stub_authentication!
    end

    describe "#index" do
      it "can see a paginated list of variants" 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it "variants returned contain option values data" 


      it "variants returned contain images data" 


      # Regression test for https://github.com/spree/spree/issues/2141
      context "a deleted variant" do
        before do
          variant.update_column(:deleted_at, Time.current)
        end

        it "is not returned in the results" 


        it "is not returned even when show_deleted is passed" 

      end

      context "stock filtering" do
        context "only variants in stock" do
          subject { get spree.api_variants_path, params: { in_stock_only: "true" } }

          context "variant is out of stock" do
            before do
              variant.stock_items.update_all(count_on_hand: 0)
            end

            it "is not returned in the results" 

          end

          context "variant is in stock" do
            before do
              variant.stock_items.update_all(count_on_hand: 10)
            end

            it "is returned in the results" 

          end
        end

        context "only suplliable variants" do
          subject { get spree.api_variants_path, params: { suppliable_only: "true" } }

          context "variant is backorderable" do
            before do
              variant.stock_items.update_all(count_on_hand: 0, backorderable: true)
            end

            it "is not returned in the results" 

          end

          context "variant is unsuppliable" do
            before do
              variant.stock_items.update_all(count_on_hand: 0, backorderable: false)
            end

            it "is returned in the results" 

          end
        end

        context "all variants" do
          subject { get spree.api_variants_path, params: { in_stock_only: "false" } }

          context "variant is out of stock" do
            before do
              variant.stock_items.update_all(count_on_hand: 0)
            end

            it "is returned in the results" 

          end

          context "variant is in stock" do
            before do
              variant.stock_items.update_all(count_on_hand: 10)
            end

            it "is returned in the results" 

          end
        end
      end

      context "pagination" do
        it "can select the next page of variants" 

      end

      context "stock item filter" do
        let(:stock_location) { variant.stock_locations.first }
        let!(:inactive_stock_location) { create(:stock_location, propagate_all_variants: true, name: "My special stock location", active: false) }

        it "only returns stock items for active stock locations" 

      end
    end

    describe "#show" do
      subject do
        get spree.api_variant_path(variant)
      end

      it "can see a single variant" 


      it "can see a single variant with images" 


      context "variant doesn't have variant properties" do
        before { subject }

        it "contains the expected attributes" 


        it "variant properties is an empty list" 

      end

      context "variant has variant properties" do
        let!(:rule) { create(:variant_property_rule, product: variant.product, option_value: variant.option_values.first) }

        before { subject }

        it "contains the expected attributes" 


        it "variant properties is an array of variant property values" 

      end
    end

    it "can learn how to create a new variant" 


    it "cannot create a new variant if not an admin" 


    it "cannot update a variant" 


    it "cannot delete a variant" 


    context "as an admin" do
      sign_in_as_admin!

      # Test for https://github.com/spree/spree/issues/2141
      context "deleted variants" do
        before do
          variant.update_column(:deleted_at, Time.current)
        end

        it "are visible by admin" 

      end

      it "can create a new variant" 


      it "creates new variants with nested option values" 


      it "can update a variant" 


      it "can delete a variant" 


      it 'variants returned contain cost price data' 

    end
  end
end

