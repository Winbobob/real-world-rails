require 'spec_helper'

describe Spree::Admin::ReimbursementsController, type: :controller do
  stub_authorization!

  before do
    Spree::RefundReason.find_or_create_by!(name: Spree::RefundReason::RETURN_PROCESSING_REASON, mutable: false)
  end

  describe '#create' do
    subject do
      spree_post :create, order_id: order.to_param, build_from_customer_return_id: customer_return.id
    end

    let(:customer_return) { create(:customer_return, line_items_count: 1) }
    let(:order) { customer_return.order }
    let(:return_item) { customer_return.return_items.first }
    let(:payment) { order.payments.first }

    it 'creates the reimbursement' 


    it 'redirects to the edit page' 

  end

  describe '#perform' do
    subject do
      spree_post :perform, order_id: order.to_param, id: reimbursement.to_param
    end

    let(:reimbursement) { create(:reimbursement) }
    let(:customer_return) { reimbursement.customer_return }
    let(:order) { reimbursement.order }
    let(:return_items) { reimbursement.return_items }
    let(:payment) { order.payments.first }

    it 'redirects to customer return page' 


    it 'performs the reimbursement' 


    context 'a Spree::Core::GatewayError is raised' do
      before do
        def controller.perform
          raise Spree::Core::GatewayError, 'An error has occurred'
        end
      end

      it 'sets an error message with the correct text' 


      it 'redirects to the edit page' 

    end
  end
end

