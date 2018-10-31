# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::StockItemsController, type: :request do
    let!(:stock_location) { create(:stock_location_with_items) }
    let!(:stock_item) { stock_location.stock_items.order(:id).first }
    let!(:attributes) {
      [:id, :count_on_hand, :backorderable,
       :stock_location_id, :variant_id]
    }

    before do
      stub_authentication!
    end

    context "as a normal user" do
      describe "#index" do
        it "can list stock items for an active stock location" 


        it "cannot list stock items for an inactive stock location" 

      end

      describe "#show" do
        it "can see a stock item for an active stock location" 


        it "cannot see a stock item for an inactive stock location" 

      end

      describe "#create" do
        it "cannot create a stock item" 

      end

      describe "#update" do
        it "cannot update a stock item" 

      end

      describe "#destroy" do
        it "cannot destroy a stock item" 

      end
    end

    context "as an admin" do
      sign_in_as_admin!

      it 'can list stock items' 


      it 'requires a stock_location_id to be passed as a parameter' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it 'gets a stock item' 


      context 'creating a stock item' do
        let!(:variant) do
          variant = create(:variant)
          # Creating a variant also creates stock items.
          # We don't want any to exist (as they would conflict with what we're about to create)
          StockItem.delete_all
          variant
        end
        let(:count_on_hand) { '20' }
        let(:params) do
          {
            stock_item: {
              variant_id: variant.id,
              count_on_hand: count_on_hand
            }
          }
        end

        subject do
          post spree.api_stock_location_stock_items_path(stock_location), params: params
        end

        it 'can create a new stock item' 


        it 'creates a stock movement' 


        context 'variant tracks inventory' do
          before do
            expect(variant.track_inventory).to eq true
          end

          it "sets the stock item's count_on_hand" 

        end

        context 'variant does not track inventory' do
          before do
            variant.update_attributes(track_inventory: false)
          end

          it "doesn't set the stock item's count_on_hand" 

        end

        context "attempting to set negative inventory" do
          let(:count_on_hand) { '-1' }

          it "does not allow negative inventory for the stock item" 

        end
      end

      context 'updating a stock item' do
        before do
          expect(stock_item.count_on_hand).to eq 10
        end

        subject do
          put spree.api_stock_item_path(stock_item), params: params
        end

        context 'adjusting count_on_hand' do
          let(:count_on_hand) { 40 }
          let(:params) do
            {
              stock_item: {
                count_on_hand: count_on_hand,
                backorderable: true
              }
            }
          end

          it 'can update a stock item to add new inventory' 


          it 'creates a stock movement for the adjusted quantity' 


          context 'tracking inventory' do
            before do
              expect(stock_item.should_track_inventory?).to eq true
            end

            it "sets the stock item's count_on_hand" 

          end

          context 'not tracking inventory' do
            before do
              stock_item.variant.update_attributes(track_inventory: false)
            end

            it "doesn't set the stock item's count_on_hand" 

          end

          context "attempting to set negative inventory" do
            let(:count_on_hand) { '-11' }

            it "does not allow negative inventory for the stock item" 

          end
        end

        context 'setting count_on_hand' do
          let(:count_on_hand) { 40 }
          let(:params) do
            {
              id: stock_item.to_param,
              stock_item: {
                count_on_hand: count_on_hand,
                backorderable: true,
                force: true
              }
            }
          end

          it 'can set a stock item to modify the current inventory' 


          it 'creates a stock movement for the adjusted quantity' 


          context 'tracking inventory' do
            before do
              expect(stock_item.should_track_inventory?).to eq true
            end

            it "updates the stock item's count_on_hand" 

          end

          context 'not tracking inventory' do
            before do
              stock_item.variant.update_attributes(track_inventory: false)
            end

            it "doesn't update the stock item's count_on_hand" 

          end

          context "attempting to set negative inventory" do
            let(:count_on_hand) { '-1' }

            it "does not allow negative inventory for the stock item" 

          end
        end
      end

      it 'can delete a stock item' 

    end
  end
end

