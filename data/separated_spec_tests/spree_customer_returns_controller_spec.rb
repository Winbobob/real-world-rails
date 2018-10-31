require 'spec_helper'

module Spree
  module Admin
    describe CustomerReturnsController, type: :controller do
      stub_authorization!

      describe '#index' do
        subject do
          spree_get :index, order_id: customer_return.order.to_param
        end

        let(:order)           { customer_return.order }
        let(:customer_return) { create(:customer_return) }

        before { subject }

        it 'loads the order' 


        it 'loads the customer return' 

      end

      describe '#new' do
        subject do
          spree_get :new, order_id: order.to_param
        end

        let(:order) { create(:shipped_order, line_items_count: 1) }
        let!(:rma) { create :return_authorization, order: order, return_items: [create(:return_item, inventory_unit: order.inventory_units.first)] }

        before do
          create(:reimbursement_type, active: false) # inactive_reimbursement_type
          create(:reimbursement_type) # first_active_reimbursement_type
          create(:reimbursement_type) # second_active_reimbursement_type
        end

        it 'loads the order' 


        it 'creates a new customer return' 


        context 'with previous customer return' do
          let(:order) { create(:shipped_order, line_items_count: 4) }
          let(:rma) { create(:return_authorization, order: order) }

          let!(:rma_return_item) { create(:return_item, return_authorization: rma, inventory_unit: order.inventory_units.first) }
          let!(:customer_return_return_item) { create(:return_item, return_authorization: rma, inventory_unit: order.inventory_units.last) }

          context 'there is a return item associated with an rma but not a customer return' do
            before do
              create(:customer_return_without_return_items, return_items: [customer_return_return_item]) # previous_customer_return
              subject
            end

            it 'loads the persisted rma return items' 


            it 'has one rma return item' 

          end
        end
      end

      describe '#edit' do
        subject do
          spree_get :edit, order_id: order.to_param, id: customer_return.to_param
        end

        let(:order) { customer_return.order }
        let(:customer_return) { create(:customer_return, line_items_count: 3) }

        let!(:accepted_return_item) { customer_return.return_items.order('id').first.tap(&:accept!) }
        let!(:rejected_return_item) { customer_return.return_items.order('id').second.tap(&:reject!) }
        let!(:manual_intervention_return_item) { customer_return.return_items.order('id').third.tap(&:require_manual_intervention!) }

        before { subject }

        it 'loads the order' 


        it 'loads the customer return' 


        it 'loads the accepted return items' 


        it 'loads the rejected return items' 


        it 'loads the return items that require manual intervention' 


        it 'loads the return items that are still pending' 


        it 'loads the reimbursements that are still pending' 

      end

      describe '#create' do
        subject do
          spree_post :create, customer_return_params
        end

        let(:order) { create(:shipped_order, line_items_count: 1) }
        let!(:return_authorization) { create :return_authorization, order: order, return_items: [create(:return_item, inventory_unit: order.inventory_units.shipped.last)] }

        context 'valid customer return' do
          let(:stock_location) { order.shipments.last.stock_location }

          let(:customer_return_params) do
            {
              order_id: order.to_param,
              customer_return: {
                stock_location_id: stock_location.id,
                return_items_attributes: {
                  '0' => {
                    id: return_authorization.return_items.first.id,
                    returned: '1',
                    'pre_tax_amount' => '15.99',
                    inventory_unit_id: order.inventory_units.shipped.last.id
                  }
                }
              }
            }
          end

          it 'creates a customer return' 


          it 'redirects to the index page' 

        end

        context 'invalid customer return' do
          let(:customer_return_params) do
            {
              order_id: order.to_param,
              customer_return: {
                stock_location_id: '',
                return_items_attributes: {
                  '0' => {
                    returned: '1',
                    'pre_tax_amount' => '15.99',
                    inventory_unit_id: order.inventory_units.shipped.last.id
                  }
                }
              }
            }
          end

          it "doesn't create a customer return" 


          it 'renders the new page' 

        end
      end
    end
  end
end

