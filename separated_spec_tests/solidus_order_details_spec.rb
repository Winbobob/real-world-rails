# frozen_string_literal: true

require 'spec_helper'

describe "Order Details", type: :feature, js: true do
  include OrderFeatureHelper

  let!(:stock_location) { create(:stock_location_with_items) }
  let!(:product) { create(:product, name: 'spree t-shirt', price: 20.00) }
  let(:order) { create(:order, state: 'complete', completed_at: "2011-02-01 12:36:15", number: "R100") }
  let(:state) { create(:state) }
  let(:line_item) { order.line_items.first }

  let!(:shipment1) do
    order.shipments.create(stock_location_id: stock_location.id)
  end

  before do
    order.contents.add(product.master, 2)
    # order.contents.add causes things (like line items & shipments) to get
    # cached, and these are going to change during this spec so we go ahead and
    # reload now
    order.reload
  end

  context 'as Admin' do
    stub_authorization!

    context "cart edit page" do
      let(:track_inventory) { true }
      let(:backorderable) { true }
      let(:count_on_hand) { 100 }

      before do
        product.master.update_columns(track_inventory: track_inventory)
        product.master.stock_items.update_all(count_on_hand: count_on_hand, backorderable: backorderable)

        visit spree.cart_admin_order_path(order)
      end

      it "should allow me to edit order details" 


      it "can add an item" 


      it "can remove an item from a shipment" 


      # Regression test for https://github.com/spree/spree/issues/3862
      it "can cancel removing an item from a shipment" 


      it "can add tracking information" 


      context "with a completed order" do
        let!(:order) { create(:completed_order_with_totals) }
        let(:shipment1) { order.shipments[0] }

        it "can change the shipping method" 


        it "can use admin-only shipping methods" 


        it "will show the variant sku" 

      end

      context "with special_instructions present" do
        let(:order) { create(:order, state: 'complete', completed_at: "2011-02-01 12:36:15", number: "R100", special_instructions: "Very special instructions here") }
        it "will show the special_instructions" 

      end

      context "variant doesn't track inventory" do
        let(:track_inventory) { false }
        let(:backorderable) { false }
        let(:count_on_hand) { 0 }

        it "adds variant to order just fine" 

      end

      context "variant out of stock and not backorderable" do
        let(:backorderable) { false }
        let(:count_on_hand) { 0 }

        it "doesn't display the out of stock variant in the search results" 

      end
    end

    context 'Shipment edit page' do
      let!(:stock_location2) { create(:stock_location_with_items, name: 'Clarksville') }

      before do
        product.master.stock_items.first.update_column(:backorderable, true)
        product.master.stock_items.first.update_column(:count_on_hand, 100)
        product.master.stock_items.last.update_column(:count_on_hand, 100)
      end

      context 'splitting to location' do
        # can not properly implement until poltergeist supports checking alert text
        # see https://github.com/teampoltergeist/poltergeist/pull/516
        it 'should warn you if you have not selected a location or shipment'

        context 'there is enough stock at the other location' do
          it 'should allow me to make a split' 


          it 'should allow me to make a transfer via splitting off all stock' 


          it 'should not allow me to split more than I had in the original shipment' 


          it 'should not allow less than or equal to zero qty' 


          context 'A shipment has shipped' do
            it 'should not show or let me back to the cart page, nor show the shipment edit buttons' 

          end
        end

        context 'there is not enough stock at the other location' do
          context 'and it cannot backorder' do
            it 'should not allow me to split stock' 

          end

          context 'but it can backorder' do
            it 'should allow me to split and backorder the stock' 

          end
        end

        context 'multiple items in cart' do
          it 'should have no problem splitting if multiple items are in the from shipment' 

        end
      end

      context 'removing an item' do
        let!(:shipment2) { order.shipments.create(stock_location_id: stock_location2.id) }

        it "removes only the one item" 

      end

      context 'splitting to shipment' do
        let!(:shipment2) { order.shipments.create(stock_location_id: stock_location2.id) }

        it 'should delete the old shipment if enough are split off' 


        context 'receiving shipment can not backorder' do
          before { product.master.stock_items.last.update_column(:backorderable, false) }

          it 'should not allow a split if the receiving shipment qty plus the incoming is greater than the count_on_hand' 


          it 'should not allow a shipment to split stock to itself' 


          it 'should split fine if more than one line_item is in the receiving shipment' 

        end

        context 'receiving shipment can backorder' do
          it 'should add more to the backorder' 

        end
      end

      describe 'line item sort order' do
        let(:product2) { create(:product) }
        let(:product3) { create(:product) }

        before do
          # grab this one first and then create others that should end up before
          # and after
          @middle_line_item = order.line_items[0]

          @first_line_item  = order.contents.add(product2.master)
          @first_line_item.update_columns(created_at: 1.day.ago)
          @last_line_item = order.contents.add(product3.master)
          @last_line_item.update_columns(created_at: 1.day.from_now)
        end

        it 'orders the items in a shipment by created_at' 

      end
    end
  end

  context 'with only read permissions' do
    before do
      allow_any_instance_of(Spree::Admin::BaseController).to receive(:spree_current_user).and_return(nil)
    end

    custom_authorization! do |_user|
      can [:admin, :index, :read, :edit], Spree::Order
    end
    it "should not display forbidden links" 

  end

  context 'as Fakedispatch' do
    custom_authorization! do |_user|
      # allow dispatch to :admin, :index, and :edit on Spree::Order
      can [:admin, :edit, :index, :read], Spree::Order
      # allow dispatch to :index, :show, :create and :update shipments on the admin
      can [:admin, :manage, :read, :ship], Spree::Shipment
    end

    before do
      allow(Spree.user_class).to receive(:find_by).
                                   with(hash_including(:spree_api_key)).
                                   and_return(Spree.user_class.new)
    end

    it 'should not display order tabs or edit buttons without ability' 


    it "can change the shipping method" 


    it 'can ship' 

  end
end

