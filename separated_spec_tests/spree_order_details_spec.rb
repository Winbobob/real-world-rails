require 'spec_helper'

describe 'Order Details', type: :feature, js: true do
  let!(:stock_location) { create(:stock_location_with_items) }
  let!(:product) { create(:product, name: 'spree t-shirt', price: 20.00) }
  let!(:store) { create(:store) }
  let(:order) { create(:order, state: 'complete', completed_at: '2011-02-01 12:36:15', number: 'R100', store_id: store.id) }
  let(:state) { create(:state) }

  before do
    create(:shipping_method, name: 'Default')
    order.shipments.create!(stock_location_id: stock_location.id)
    order.contents.add(product.master, 2)
  end

  context 'as Admin' do
    stub_authorization!

    context 'store edit page' do
      let!(:new_store) { create(:store) }

      before do
        product.master.stock_items.first.update_column(:count_on_hand, 100)
        visit spree.store_admin_order_path(order)
      end

      it 'displays select with current order store name' 


      it 'after selecting a store assings a new store to order' 

    end

    context 'cart edit page' do
      before do
        product.master.stock_items.first.update_column(:count_on_hand, 100)
        visit spree.cart_admin_order_path(order)
      end

      it 'allows me to edit order details' 


      it 'can add an item to a shipment' 


      it 'can remove an item from a shipment' 


      # Regression test for #3862
      it 'can cancel removing an item from a shipment' 


      it 'can add tracking information' 


      it 'can change the shipping method' 


      it 'can assign a back-end only shipping method' 


      it 'will show the variant sku', js: false do
        order = create(:completed_order_with_totals)
        visit spree.edit_admin_order_path(order)
        sku = order.line_items.first.variant.sku
        expect(page).to have_content("SKU: #{sku}")
      end

      context 'with special_instructions present' do
        before do
          order.update_column(:special_instructions, 'Very special instructions here')
        end

        it 'will show the special_instructions', js: false do
          visit spree.edit_admin_order_path(order)
          expect(page).to have_content('Very special instructions here')
        end
      end

      context 'when not tracking inventory' do
        let(:tote) { create(:product, name: 'Tote', price: 15.00) }

        context "variant doesn't track inventory" do
          before do
            tote.master.update_column :track_inventory, false
            # make sure there's no stock level for any item
            tote.master.stock_items.update_all count_on_hand: 0, backorderable: false
          end

          it 'adds variant to order just fine' 

        end

        context "site doesn't track inventory" do
          before do
            Spree::Config[:track_inventory_levels] = false
            tote.master.update_column(:track_inventory, true)
            # make sure there's no stock level for any item
            tote.master.stock_items.update_all count_on_hand: 0, backorderable: true
          end

          it 'adds variant to order just fine' 


          after { Spree::Config[:track_inventory_levels] = true }
        end
      end

      context 'variant out of stock and not backorderable' do
        before do
          product.master.stock_items.first.update_column(:backorderable, false)
          product.master.stock_items.first.update_column(:count_on_hand, 0)
        end

        it 'displays out of stock instead of add button' 

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
        before { visit spree.edit_admin_order_path(order) }
        # can not properly implement until poltergeist supports checking alert text
        # see https://github.com/teampoltergeist/poltergeist/pull/516
        it 'should warn you if you have not selected a location or shipment'

        context 'there is enough stock at the other location' do
          it 'allows me to make a split' 


          it 'allows me to make a transfer via splitting off all stock' 


          it 'allows me to split more than I have if available there' 


          it 'does not split anything if the input quantity is garbage' 


          it 'does not allow less than or equal to zero qty' 


          context 'A shipment has shipped' do
            it 'does not show or let me back to the cart page, nor show the shipment edit buttons', js: false do
              order = create(:order, state: 'payment')
              order.shipments.create!(stock_location_id: stock_location.id, state: 'shipped')

              visit spree.cart_admin_order_path(order)

              expect(page).to have_current_path(spree.edit_admin_order_path(order))
              expect(page).not_to have_text 'Cart'
            end
          end
        end

        context 'there is not enough stock at the other location' do
          context 'and it cannot backorder' do
            it 'does not allow me to split stock' 

          end

          context 'but it can backorder' do
            it 'allows me to split and backorder the stock' 

          end
        end

        context 'multiple items in cart' do
          it 'has no problem splitting if multiple items are in the from shipment' 

        end

        context 'when not tracking inventory' do
          let(:tote) { create(:product, name: 'Tote', price: 15.00) }

          context "variant doesn't track inventory" do
            before do
              tote.master.update_column :track_inventory, false
              # make sure there's no stock level for any item
              tote.master.stock_items.update_all count_on_hand: 0, backorderable: false
            end

            it 'adds variant to order just fine' 

          end

          context "site doesn't track inventory" do
            before do
              Spree::Config[:track_inventory_levels] = false
              tote.master.update_column(:track_inventory, true)
              # make sure there's no stock level for any item
              tote.master.stock_items.update_all count_on_hand: 0, backorderable: true
            end

            it 'adds variant to order just fine' 


            after { Spree::Config[:track_inventory_levels] = true }
          end
        end

        context 'variant out of stock and not backorderable' do
          before do
            product.master.stock_items.first.update_column(:backorderable, false)
            product.master.stock_items.first.update_column(:count_on_hand, 0)
          end

          it 'displays out of stock instead of add button' 

        end
      end

      context 'splitting to shipment' do
        before do
          @shipment2 = order.shipments.create(stock_location_id: stock_location2.id)
          visit spree.edit_admin_order_path(order)
        end

        it 'deletes the old shipment if enough are split off' 


        context 'receiving shipment can not backorder' do
          before { product.master.stock_items.last.update_column(:backorderable, false) }

          it 'does not allow a split if the receiving shipment qty plus the incoming is greater than the count_on_hand' 


          it 'does not allow a shipment to split stock to itself' 


          it 'splits fine if more than one line_item is in the receiving shipment' 

        end

        context 'receiving shipment can backorder' do
          it 'adds more to the backorder' 

        end
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

    it 'does not display forbidden links' 

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

    it 'does not display order tabs or edit buttons without ability', js: false do
      visit spree.edit_admin_order_path(order)

      # Order Form
      expect(page).not_to have_css('.edit-item')
      # Order Tabs
      expect(page).not_to have_link('Details')
      expect(page).not_to have_link('Customer')
      expect(page).not_to have_link('Adjustments')
      expect(page).not_to have_link('Payments')
      expect(page).not_to have_link('Returns')
    end

    it 'can add tracking information' 


    it 'can change the shipping method' 


    it 'can ship' 

  end
end

