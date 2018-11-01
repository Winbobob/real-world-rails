# frozen_string_literal: true

require 'spec_helper'

module Spree
  PermittedAttributes.module_eval do
    mattr_writer :line_item_attributes
  end

  unless PermittedAttributes.line_item_attributes.include? :options
    PermittedAttributes.line_item_attributes << { options: [:some_option] }
  end

  describe Api::LineItemsController, type: :request do
    let!(:order) { create(:order_with_line_items, line_items_count: 1) }

    let(:product) { create(:product) }
    let(:attributes) { [:id, :quantity, :price, :variant, :total, :display_amount, :single_display_amount] }
    let(:resource_scoping) { { order_id: order.to_param } }

    before do
      stub_authentication!
    end

    it "can learn how to create a new line item" 


    context "authenticating with a token" do
      it "can add a new line item to an existing order" 


      it "can add a new line item to an existing order with token in header" 

    end

    context "as the order owner" do
      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      context "dealing with a completed order" do
        let!(:order) { create(:completed_order_with_totals) }

        it "can't add a new line item" 


        it "can't update a line item" 


        it "can't delete a line item" 

      end

      it "can add a new line item to an existing order" 


      it "can add a new line item to an existing order with options" 


      it "default quantity to 1 if none is given" 


      it "increases a line item's quantity if it exists already" 


      it "can update a line item on the order" 


      it "can update a line item's options on the order" 


      it "can delete a line item on the order" 


      context "order contents changed after shipments were created" do
        let!(:store) { create(:store) }
        let!(:order) { Order.create(store: store) }
        let!(:line_item) { order.contents.add(product.master) }

        before { order.create_proposed_shipments }

        it "clear out shipments on create" 


        it "clear out shipments on update" 


        it "clear out shipments on delete" 


        context "order is completed" do
          before do
            allow(order).to receive_messages completed?: true
            allow(Order).to receive_message_chain :includes, find_by!: order
          end

          it "doesn't destroy shipments or restart checkout flow" 

        end
      end
    end

    context "as just another user" do
      before do
        user = create(:user)
        allow(Spree.user_class).to receive(:find_by).
                                     and_return(user)
      end

      it "cannot add a new line item to the order" 


      it "cannot update a line item on the order" 


      it "cannot delete a line item on the order" 

    end
  end
end

