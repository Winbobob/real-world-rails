require 'spec_helper'

describe SubscriptionConfirmJob do
  let(:job) { SubscriptionConfirmJob.new }

  describe "finding proxy_orders that are ready to be confirmed" do
    let(:shop) { create(:distributor_enterprise) }
    let(:order_cycle1) { create(:simple_order_cycle, coordinator: shop, orders_close_at: 59.minutes.ago, updated_at: 1.day.ago) }
    let(:order_cycle2) { create(:simple_order_cycle, coordinator: shop, orders_close_at: 61.minutes.ago, updated_at: 1.day.ago) }
    let(:schedule) { create(:schedule, order_cycles: [order_cycle1, order_cycle2]) }
    let(:subscription) { create(:subscription, shop: shop, schedule: schedule) }
    let!(:proxy_order) { create(:proxy_order, subscription: subscription, order_cycle: order_cycle1, placed_at: 5.minutes.ago, order: create(:order, completed_at: 1.minute.ago)) }
    let(:proxy_orders) { job.send(:proxy_orders) }

    it "returns proxy orders that meet all of the criteria" 


    it "ignores proxy orders where the OC closed more than 1 hour ago" 


    it "ignores proxy orders for paused subscriptions" 


    it "ignores proxy orders for cancelled subscriptions" 


    it "ignores cancelled proxy orders" 


    it "ignores proxy orders without a completed order" 


    it "ignores proxy orders without an associated order" 


    it "ignores proxy orders that haven't been placed yet" 


    it "ignores proxy orders that have already been confirmed" 

  end

  describe "performing the job" do
    context "when unconfirmed proxy_orders exist" do
      let!(:proxy_order) { create(:proxy_order) }

      before do
        proxy_order.initialise_order!
        allow(job).to receive(:proxy_orders) { ProxyOrder.where(id: proxy_order.id) }
        allow(job).to receive(:process!)
        allow(job).to receive(:send_confirmation_summary_emails)
      end

      it "marks confirmable proxy_orders as processed by setting confirmed_at" 


      it "processes confirmable proxy_orders" 


      it "sends a summary email" 

    end
  end

  describe "finding recently closed order cycles" do
    let!(:order_cycle1) { create(:simple_order_cycle, orders_close_at: 61.minutes.ago, updated_at: 61.minutes.ago) }
    let!(:order_cycle2) { create(:simple_order_cycle, orders_close_at: nil, updated_at: 59.minutes.ago) }
    let!(:order_cycle3) { create(:simple_order_cycle, orders_close_at: 61.minutes.ago, updated_at: 59.minutes.ago) }
    let!(:order_cycle4) { create(:simple_order_cycle, orders_close_at: 59.minutes.ago, updated_at: 61.minutes.ago) }
    let!(:order_cycle5) { create(:simple_order_cycle, orders_close_at: 1.minute.from_now) }

    it "returns closed order cycles whose orders_close_at or updated_at date is within the last hour" 

  end

  describe "processing an order" do
    let(:shop) { create(:distributor_enterprise) }
    let(:order_cycle1) { create(:simple_order_cycle, coordinator: shop) }
    let(:order_cycle2) { create(:simple_order_cycle, coordinator: shop) }
    let(:schedule1) { create(:schedule, order_cycles: [order_cycle1, order_cycle2]) }
    let(:subscription1) { create(:subscription, shop: shop, schedule: schedule1, with_items: true) }
    let(:proxy_order) { create(:proxy_order, subscription: subscription1) }
    let(:order) { proxy_order.initialise_order! }

    before do
      while !order.completed? do break unless order.next! end
      allow(job).to receive(:send_confirm_email).and_call_original
      job.instance_variable_set(:@order, order)
      Spree::MailMethod.create!(
        environment: Rails.env,
        preferred_mails_from: 'spree@example.com'
      )
      expect(job).to receive(:record_order).with(order)
    end

    context "when payments need to be processed" do
      let(:payment_method) { create(:payment_method) }
      let(:payment) { double(:payment, amount: 10) }

      before do
        allow(order).to receive(:payment_total) { 0 }
        allow(order).to receive(:total) { 10 }
        allow(order).to receive(:pending_payments) { [payment] }
      end

      context "and an error is added to the order when updating payments" do
        before { expect(job).to receive(:update_payment!) { order.errors.add(:base, "a payment error") } }

        it "sends a failed payment email" 

      end

      context "and no errors are added when updating payments" do
        before { expect(job).to receive(:update_payment!) { true } }

        context "when an error occurs while processing the payment" do
          before do
            expect(payment).to receive(:process!).and_raise Spree::Core::GatewayError, "payment failure error"
          end

          it "sends a failed payment email" 

        end

        context "when payments are processed without error" do
          before do
            expect(payment).to receive(:process!) { true }
            expect(payment).to receive(:completed?) { true }
          end

          it "sends only a subscription confirm email, no regular confirmation emails" 

        end
      end
    end
  end

  describe "#send_confirm_email" do
    let(:order) { double(:order) }
    let(:mail_mock) { double(:mailer_mock, deliver: true) }

    before do
      job.instance_variable_set(:@order, order)
      allow(SubscriptionMailer).to receive(:confirmation_email) { mail_mock }
    end

    it "records a success and sends the email" 

  end

  describe "#send_failed_payment_email" do
    let(:order) { double(:order) }
    let(:mail_mock) { double(:mailer_mock, deliver: true) }

    before do
      job.instance_variable_set(:@order, order)
      allow(SubscriptionMailer).to receive(:failed_payment_email) { mail_mock }
    end

    it "records and logs an error and sends the email" 

  end
end

