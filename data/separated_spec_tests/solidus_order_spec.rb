# frozen_string_literal: true

require 'rails_helper'

module Spree
  module Core
    RSpec.describe Importer::Order do
      let!(:store) { create(:store) }
      let!(:country) { create(:country) }
      let!(:state) { country.states.first || create(:state, country: country) }
      let!(:stock_location) { create(:stock_location, admin_name: 'Admin Name') }

      let(:user) { stub_model(LegacyUser, email: 'fox@mudler.com') }
      let(:shipping_method) { create(:shipping_method) }
      let(:payment_method) { create(:check_payment_method) }

      let(:product) {
        product = Spree::Product.create(name: 'Test',
                                             sku: 'TEST-1',
                                             price: 33.22)
        product.shipping_category = create(:shipping_category)
        product.save
        product
      }

      let(:variant) {
        variant = product.master
        variant.stock_items.each { |si| si.set_count_on_hand(10) }
        variant
      }

      let(:sku) { variant.sku }
      let(:variant_id) { variant.id }

      let(:line_items) { { "0" => { variant_id: variant.id, quantity: 5 } } }
      let(:ship_address) {
        {
         address1: '123 Testable Way',
         firstname: 'Fox',
         lastname: 'Mulder',
         city: 'Washington',
         country_id: country.id,
         state_id: state.id,
         zipcode: '66666',
         phone: '666-666-6666'
      }}

      it 'can import an order number' 


      it 'optionally add completed at' 


      it "assigns order[email] over user email to order" 


      context "assigning a user to an order" do
        let(:other_user) { stub_model(LegacyUser, email: 'dana@scully.com') }

        context "as an admin" do
          before { allow(user).to receive_messages has_spree_role?: true }

          context "a user's id is not provided" do
            context "nil user id is provided" do
              it "unassociates the admin user from the order" 

            end

            context "another user's id is provided" do
              it "permits the user to be assigned" 

            end
          end

          context "a user's id is not provided" do
            it "doesn't unassociate the admin from the order" 

          end
        end

        context "as a user" do
          before { allow(user).to receive_messages has_spree_role?: false }
          it "does not assign the order to the other user" 

        end
      end

      it 'can build an order from API with just line items' 


      it 'handles line_item updating exceptions' 


      it 'can build an order from API with variant sku' 


      it 'can build an order from API shipping address' 


      it 'can build an order from API with country attributes' 


      it 'can build an order from API with state attributes' 


      context "with a different currency" do
        let(:params) { { currency: "GBP" } }

        it "sets the order currency" 


        context "when a line item price is specified" do
          let(:params) { { currency: "GBP", line_items_attributes: line_items } }

          before { line_items["0"][:price] = 1.99 }

          context "and price is present in the order currency" do
            before { variant.prices.create(currency: "GBP", amount: 18.99) }

            it "assigns a price correctly" 

          end

          context "and no price is present in the order currency" do
            it "raises an exception" 

          end
        end
      end

      context "state passed is not associated with country" do
        let(:params) do
          {
            ship_address_attributes: ship_address,
            line_items_attributes: line_items
          }
        end

        let(:other_state) { create(:state, name: "Uhuhuh", country: create(:country)) }

        before do
          ship_address.delete(:state_id)
          ship_address[:state] = { 'name' => other_state.name }
        end

        it 'sets states name instead of state id' 

      end

      it 'sets state name if state record not found' 


      context 'variant not deleted' do
        it 'ensures variant id from api' 

      end

      context 'variant was soft-deleted' do
        it 'raise error as variant shouldnt be found' 

      end

      it 'ensures_country_id for country fields' 


      it "raises with proper message when cant find country" 


      it 'ensures_state_id for state fields' 


      context "shipments" do
        let(:params) do
          {
            shipments_attributes: [
              {
                tracking: '123456789',
                cost: '14.99',
                shipping_method: shipping_method.name,
                stock_location: stock_location.name,
                inventory_units: [{ sku: sku }]
              }
            ]
          }
        end

        it 'ensures variant exists and is not deleted' 


        it 'builds them properly' 


        it "accepts admin name for stock location" 


        it "raises if cant find stock location" 


        context 'when completed_at and shipped_at present' do
          let(:params) do
            {
              completed_at: 2.days.ago,
              shipments_attributes: [
                {
                  tracking: '123456789',
                  cost: '4.99',
                  shipped_at: 1.day.ago,
                  shipping_method: shipping_method.name,
                  stock_location: stock_location.name,
                  inventory_units: [{ sku: sku }]
                }
              ]
            }
          end

          it 'builds them properly' 

        end
      end

      it 'adds adjustments' 


      it "calculates final order total correctly" 


      it 'builds a payment using state' 


      it 'builds a payment using status as fallback' 


      it 'build a source payment using years and month' 


      it 'handles source building exceptions when do not have years and month' 


      context "raises error" do
        it "clears out order from db" 

      end
    end
  end
end

