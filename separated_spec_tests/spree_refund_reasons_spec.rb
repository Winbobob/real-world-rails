require 'spec_helper'

describe 'RefundReason', type: :feature, js: true do
  stub_authorization!

  let!(:amount) { 100.0 }
  let!(:payment_amount) { amount * 2 }
  let!(:payment_method) { create(:credit_card_payment_method) }
  let!(:payment) { create(:payment, amount: payment_amount, payment_method: payment_method) }
  let!(:refund_reason) { create(:default_refund_reason, name: 'Reason #1', mutable: true) }
  let!(:refund_reason2) { create(:refund_reason, name: 'Reason #2', mutable: true) }

  before do
    create(:refund, payment: payment, amount: amount, reason: refund_reason, transaction_id: nil)
    visit spree.admin_refund_reasons_path
  end

  describe 'destroy' do
    it 'has refund reasons' 


    context 'should not destroy an associated option type' do
      before { within_row(1) { delete_product_property } }

      it 'has persisted refund reasons' 


      it(js: false) { expect(Spree::RefundReason.all).to include(refund_reason) }
      it(js: false) { expect(Spree::RefundReason.all).to include(refund_reason2) }
    end

    context 'should allow an admin to destroy a non associated option type' do
      before { within_row(2) { delete_product_property } }

      it 'has persisted refund reasons' 


      it(js: false) { expect(Spree::RefundReason.all).to include(refund_reason) }
      it(js: false) { expect(Spree::RefundReason.all).not_to include(refund_reason2) }
    end

    def delete_product_property
      spree_accept_alert do
        click_icon :delete
        wait_for_ajax
      end
      wait_for_ajax
    end
  end
end
