# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::ReimbursementsController, type: :controller do
  stub_authorization!

  let!(:default_refund_reason) do
    Spree::RefundReason.find_or_create_by!(name: Spree::RefundReason::RETURN_PROCESSING_REASON, mutable: false)
  end

  describe '#edit' do
    let(:reimbursement) { create(:reimbursement) }
    let(:order) { reimbursement.order }
    let!(:active_stock_location) { create(:stock_location, active: true) }
    let!(:inactive_stock_location) { create(:stock_location, active: false) }

    subject do
      get :edit, params: { order_id: order.to_param, id: reimbursement.to_param }
    end

    it "loads all the active stock locations" 

  end

  describe '#create' do
    let(:customer_return) { create(:customer_return, line_items_count: 1) }
    let(:order) { customer_return.order }
    let(:return_item) { customer_return.return_items.first }
    let(:payment) { order.payments.first }
    before { return_item.receive! }

    subject do
      post :create, params: { order_id: order.to_param, build_from_customer_return_id: customer_return.id }
    end

    it 'creates the reimbursement' 


    it 'redirects to the edit page' 


    context 'when create fails' do
      before do
        allow_any_instance_of(Spree::Reimbursement).to receive(:valid?) do |reimbursement, *_args|
          reimbursement.errors.add(:base, 'something bad happened')
          false
        end
      end

      context 'when a referer header is present' do
        let(:referer) { spree.edit_admin_order_customer_return_path(order, customer_return) }

        it 'redirects to the referer' 

      end

      context 'when a referer header is not present' do
        it 'redirects to the admin root' 

      end
    end
  end

  describe "#perform" do
    let(:reimbursement) { create(:reimbursement) }
    let(:customer_return) { reimbursement.customer_return }
    let(:order) { reimbursement.order }
    let(:return_items) { reimbursement.return_items }
    let(:payment) { order.payments.first }

    subject do
      post :perform, params: { order_id: order.to_param, id: reimbursement.to_param }
    end

    it 'redirects to customer return page' 


    it 'performs the reimbursement' 


    context "a Spree::Core::GatewayError is raised" do
      before(:each) do
        def controller.perform
          raise Spree::Core::GatewayError.new('An error has occurred')
        end
      end

      it "sets an error message with the correct text" 


      it 'redirects to the edit page' 

    end
  end
end

