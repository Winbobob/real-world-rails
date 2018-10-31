require 'spec_helper'

module Spree
  PermittedAttributes.module_eval do
    mattr_writer :line_item_attributes
  end

  unless PermittedAttributes.line_item_attributes.include?(:some_option)
    PermittedAttributes.line_item_attributes += [:some_option]
  end

  # This should go in an initializer
  Spree::Api::V1::LineItemsController.line_item_options += [:some_option]

  describe Api::V1::LineItemsController, type: :controller do
    render_views

    let!(:order) { create(:order_with_line_items, line_items_count: 1) }

    let(:product) { create(:product) }
    let(:attributes) { [:id, :quantity, :price, :variant, :total, :display_amount, :single_display_amount] }
    let(:resource_scoping) { { order_id: order.to_param } }
    let(:admin_role) { create(:admin_role) }

    before do
      stub_authentication!
    end

    it 'can learn how to create a new line item' 


    context 'authenticating with a token' do
      it 'can add a new line item to an existing order' 


      it 'can add a new line item to an existing order with token in header' 

    end

    context 'as the order owner' do
      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      it 'can add a new line item to an existing order' 


      it 'can add a new line item to an existing order with options' 


      it 'default quantity to 1 if none is given' 


      it "increases a line item's quantity if it exists already" 


      it 'can update a line item on the order' 


      it "can update a line item's options on the order" 


      it 'can delete a line item on the order' 


      context 'order contents changed after shipments were created' do
        let!(:order) { Order.create }
        let!(:line_item) { order.contents.add(product.master) }

        before { order.create_proposed_shipments }

        it 'clear out shipments on create' 


        it 'clear out shipments on update' 


        it 'clear out shipments on delete' 


        context 'order is completed' do
          before do
            current_api_user.spree_roles << admin_role
            order.reload
            allow(order).to receive_messages completed?: true
            allow(Order).to receive_message_chain :includes, find_by!: order
          end

          it "doesn't destroy shipments or restart checkout flow" 


          context 'deleting line items' do
            let!(:shipments) { order.shipments.load }

            it 'restocks product after line item removal' 


            it 'calls `restock` on proper stock location' 

          end
        end
      end
    end

    context 'as just another user' do
      before { create(:user) }

      it 'cannot add a new line item to the order' 


      it 'cannot update a line item on the order' 


      it 'cannot delete a line item on the order' 

    end
  end
end

