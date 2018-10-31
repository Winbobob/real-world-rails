require 'spec_helper'

describe Spree::Admin::PaymentsController, type: :controller do
  let!(:shop) { create(:enterprise) }
  let!(:user) { shop.owner }
  let!(:order) { create(:order, distributor: shop) }
  let!(:line_item) { create(:line_item, order: order, price: 5.0) }

  context "as an enterprise user" do
    before do
      allow(controller).to receive(:spree_current_user) { user }
      order.reload.update_totals
    end

    context "requesting a refund on a payment" do
      let(:params) { { id: payment.id, order_id: order.number, e: :void } }

      # Required for the respond override in the controller decorator to work
      before { @request.env['HTTP_REFERER'] = spree.admin_order_payments_url(payment) }

      context "that was processed by stripe" do
        let!(:payment_method) { create(:stripe_payment_method, distributors: [shop], preferred_enterprise_id: shop.id) }
        # let!(:credit_card) { create(:credit_card, gateway_customer_profile_id: "cus_1", gateway_payment_profile_id: 'card_2') }
        let!(:payment) { create(:payment, order: order, state: 'completed', payment_method: payment_method, response_code: 'ch_1a2b3c', amount: order.total) }


        before do
          allow(Stripe).to receive(:api_key) { "sk_test_12345" }
        end

        context "where the request succeeds" do
          before do
            stub_request(:post, "https://sk_test_12345:@api.stripe.com/v1/charges/ch_1a2b3c/refunds").
              to_return(:status => 200, :body => JSON.generate(id: 're_123', object: 'refund', status: 'succeeded') )
          end

          it "voids the payment" 

        end

        context "where the request fails" do
          before do
            stub_request(:post, "https://sk_test_12345:@api.stripe.com/v1/charges/ch_1a2b3c/refunds").
              to_return(:status => 200, :body => JSON.generate(error: { message: "Bup-bow!"}) )
          end

          it "does not void the payment" 

        end
      end
    end
  end
end

