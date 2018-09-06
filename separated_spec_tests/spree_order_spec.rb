require 'spec_helper'

module Spree
  module Core
    describe Importer::Order do
      let!(:country) { create(:country) }
      let!(:state) { country.states.first || create(:state, country: country) }
      let!(:stock_location) { create(:stock_location, admin_name: 'Admin Name') }

      let(:user) { stub_model(LegacyUser, email: 'fox@mudler.com') }
      let(:shipping_method) { create(:shipping_method) }
      let(:payment_method) { create(:check_payment_method) }

      let(:product) do
        product = Spree::Product.create(name: 'Test',
                                        sku: 'TEST-1',
                                        price: 33.22, available_on: Time.current - 1.day)
        product.shipping_category = create(:shipping_category)
        product.save
        product
      end

      let(:variant) do
        variant = product.master
        variant.stock_items.each { |si| si.update_attribute(:count_on_hand, 10) }
        variant
      end

      let(:sku) { variant.sku }
      let(:variant_id) { variant.id }

      let(:line_items) { [{ variant_id: variant.id, quantity: 5 }] }
      let(:ship_address) do
        {
          address1: '123 Testable Way',
          firstname: 'Fox',
          lastname: 'Mulder',
          city: 'Washington',
          country_id: country.id,
          state_id: state.id,
          zipcode: '66666',
          phone: '666-666-6666'
        }
      end

      it 'can import an order number' 


      it 'optionally add completed at' 


      it 'assigns order[email] over user email to order' 


      context 'assigning a user to an order' do
        let(:other_user) { stub_model(LegacyUser, email: 'dana@scully.com') }

        context 'as an admin' do
          before { allow(user).to receive_messages has_spree_role?: true }

          context "a user's id is not provided" do
            # this is a regression spec for an issue we ran into at Bonobos
            it "doesn't unassociate the admin from the order" 

          end
        end

        context 'as a user' do
          before { allow(user).to receive_messages has_spree_role?: false }
          it 'does not assign the order to the other user' 

        end
      end

      it 'can build an order from API with just line items' 


      it 'handles line_item building exceptions' 


      it 'handles line_item updating exceptions' 


      it 'can build an order from API with variant sku' 


      it 'handles exceptions when sku is not found' 


      it 'can build an order from API shipping address' 


      it 'can build an order from API with country attributes' 


      it 'handles country lookup exceptions' 


      it 'can build an order from API with state attributes' 


      context 'with a different currency' do
        before { variant.price_in('GBP').update_attribute(:price, 18.99) }

        it 'sets the order currency' 


        it 'can handle it when a line order price is specified' 

      end

      context 'state passed is not associated with country' do
        let(:params) do
          {
            ship_address_attributes: ship_address,
            line_items_attributes: line_items
          }
        end

        let(:other_state) { create(:state, name: 'Uhuhuh', country: create(:country)) }

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

      context 'variant was deleted' do
        it 'raise error as variant shouldnt be found' 

      end

      it 'ensures_country_id for country fields' 


      it 'raises with proper message when cant find country' 


      it 'ensures_state_id for state fields' 


      context 'shipments' do
        let(:params) do
          {
            line_items_attributes: line_items,
            shipments_attributes: [
              {
                tracking: '123456789',
                cost: '14.99',
                shipping_method: shipping_method.name,
                stock_location: stock_location.name,
                inventory_units: Array.new(3) { { sku: sku, variant_id: variant.id } }
              },
              {
                tracking: '123456789',
                cost: '14.99',
                shipping_method: shipping_method.name,
                stock_location: stock_location.name,
                inventory_units: Array.new(2) { { sku: sku, variant_id: variant.id } }
              }
            ]
          }
        end

        it 'ensures variant exists and is not deleted' 


        it 'builds them properly' 


        it 'allocates inventory units to the correct shipments' 


        it 'accepts admin name for stock location' 


        it 'raises if cant find stock location' 


        context 'when a shipping adjustment is present' do
          it 'creates the shipping adjustment' 

        end

        context 'when completed_at and shipped_at present' do
          let(:params) do
            {
              completed_at: 2.days.ago,
              line_items_attributes: line_items,
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

      it 'handles shipment building exceptions' 


      it 'adds adjustments' 


      it 'adds line item adjustments from promotion' 


      it 'adds line item adjustments from taxation' 


      it 'calculates final order total correctly' 


      it 'handles adjustment building exceptions' 


      it 'builds a payment using state' 


      it 'builds a payment using status as fallback' 


      it 'handles payment building exceptions' 


      it 'build a source payment using years and month' 


      it 'handles source building exceptions when do not have years and month' 


      it 'builds a payment with an optional created_at' 


      context 'raises error' do
        it 'clears out order from db' 

      end
    end
  end
end

