# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::ProductsController, type: :controller do
  stub_authorization!

  context "#index" do
    let(:ability_user) { stub_model(Spree::LegacyUser, has_spree_role?: true) }

    # Regression test for https://github.com/spree/spree/issues/1259
    it "can find a product by SKU" 


    # Regression test for https://github.com/spree/spree/issues/1903
    context 'when soft deleted products exist' do
      let!(:soft_deleted_product) { create(:product, sku: "ABC123") }
      before { soft_deleted_product.discard }

      context 'when params[:q][:with_deleted] is not set' do
        let(:params) { { q: {} } }

        it 'filters out soft-deleted products by default' 

      end

      context 'when params[:q][:with_deleted] is set to "true"' do
        let(:params) { { q: { with_deleted: 'true' } } }

        it 'includes soft-deleted products' 

      end
    end
  end

  # regression test for https://github.com/spree/spree/issues/1370
  context "adding properties to a product" do
    let!(:product) { create(:product) }
    specify do
      put :update, params: { id: product.to_param, product: { product_properties_attributes: { "1" => { property_name: "Foo", value: "bar" } } } }
      expect(flash[:success]).to eq("Product #{product.name.inspect} has been successfully updated!")
    end
  end

  # regression test for https://github.com/solidusio/solidus/issues/2791
  context "creating a product" do
    before(:all) do
      create(:shipping_category)
    end

    it "creates a product" 


    context "when there is a taxon" do
      let(:first_taxon) { create(:taxon) }

      it "creates a product with a taxon" 


      context "when their are multiple taxons" do
        let(:second_taxon) { create(:taxon) }

        it "creates a product with multiple taxons" 

      end
    end
  end

  context "adding taxons to a product" do
    let(:product) { create(:product) }
    let(:first_taxon) { create(:taxon) }

    it "adds a single taxon to a product" 


    context "when there are mulitple taxons" do
      let(:second_taxon) { create(:taxon) }

      it "adds multiple taxons to a product" 

    end
  end

  describe "creating variant property rules" do
    let(:first_property) { create(:property) }
    let(:second_property) { create(:property) }
    let(:option_value) { create(:option_value) }
    let!(:product) { create(:product, option_types: [option_value.option_type]) }
    let(:payload) do
      {
        id: product.to_param,
        product: {
          id: product.id,
          variant_property_rules_attributes: {
            "0" => {
              option_value_ids: option_value.id,
              values_attributes: {
                "0" => {
                  property_name: first_property.name,
                  value: "First"
                },
                "1" => {
                  property_name: second_property.name,
                  value: "Second"
                }
              }
            }
          }
        }
      }
    end

    subject { put :update, params: payload }

    it "creates a variant property rule" 


    it "creates a variant property rule condition" 


    it "creates a variant property rule value for the 'First' value" 


    it "creates a variant property rule value for the 'Second' value" 


    it "redirects to the product properties page" 

  end

  describe "updating variant property rules" do
    let(:first_property) { create(:property) }
    let(:second_property) { create(:property) }
    let(:option_value) { create(:option_value) }
    let(:original_option_value) { create(:option_value) }
    let!(:product) { create(:product, option_types: [option_value.option_type]) }
    let!(:rule) do
      create(:variant_property_rule, product: product, option_value: original_option_value)
    end
    let(:payload) do
      {
        id: product.to_param,
        product: {
          id: product.id,
          variant_property_rules_attributes: {
            "0" => {
              id: rule.id,
              option_value_ids: option_value.id,
              values_attributes: {
                "0" => {
                  property_name: first_property.name,
                  value: "First Edit"
                },
                "1" => {
                  property_name: second_property.name,
                  value: "Second Edit"
                }
              }
            }
          }
        }
      }
    end

    subject { put :update, params: payload }

    it "does not create any new rules" 


    it "replaces the rule's condition" 


    it "adds two values to the rule" 


    it "creates the 'First Edit' value" 


    it "creates the 'Second Edit' value" 


    it "redirects to the product properties page" 

  end

  context "cloning a product" do
    let!(:product) { create(:product) }

    it "duplicates the product" 

  end

  # regression test for https://github.com/spree/spree/issues/801
  context "destroying a product" do
    let(:product) do
      product = create(:product)
      create(:variant, product: product)
      product
    end

    it "deletes all the variants (including master) for the product" 

  end
end

