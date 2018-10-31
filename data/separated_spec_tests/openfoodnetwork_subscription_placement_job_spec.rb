require 'spec_helper'

describe SubscriptionPlacementJob do
  let(:job) { SubscriptionPlacementJob.new }

  describe "finding proxy_orders that are ready to be placed" do
    let(:shop) { create(:distributor_enterprise) }
    let(:order_cycle1) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 1.minute.ago, orders_close_at: 10.minutes.from_now) }
    let(:order_cycle2) { create(:simple_order_cycle, coordinator: shop, orders_open_at: 10.minutes.ago, orders_close_at: 1.minute.ago) }
    let(:schedule) { create(:schedule, order_cycles: [order_cycle1, order_cycle2]) }
    let(:subscription) { create(:subscription, shop: shop, schedule: schedule) }
    let!(:proxy_order) { create(:proxy_order, subscription: subscription, order_cycle: order_cycle1) } # OK

    it "ignores proxy orders where the OC has closed" 


    it "ignores proxy orders for paused or cancelled subscriptions" 


    it "ignores proxy orders that have been marked as cancelled or placed" 

  end

  describe "performing the job" do
    context "when unplaced proxy_orders exist" do
      let!(:proxy_order) { create(:proxy_order) }

      before do
        allow(job).to receive(:proxy_orders) { ProxyOrder.where(id: proxy_order.id) }
        allow(job).to receive(:process)
      end

      it "marks placeable proxy_orders as processed by setting placed_at" 


      it "processes placeable proxy_orders" 

    end
  end

  describe "checking that line items are available to purchase" do
    let(:order_cycle) { create(:simple_order_cycle) }
    let(:shop) { order_cycle.coordinator }
    let(:order) { create(:order, order_cycle: order_cycle, distributor: shop) }
    let(:ex) { create(:exchange, :order_cycle => order_cycle, :sender => shop, :receiver => shop, :incoming => false) }
    let(:variant1) { create(:variant, count_on_hand: 5) }
    let(:variant2) { create(:variant, count_on_hand: 5) }
    let(:variant3) { create(:variant, count_on_hand: 5) }
    let!(:line_item1) { create(:line_item, order: order, variant: variant1, quantity: 3) }
    let!(:line_item2) { create(:line_item, order: order, variant: variant2, quantity: 3) }
    let!(:line_item3) { create(:line_item, order: order, variant: variant3, quantity: 3) }

    before { Spree::Config.set(:allow_backorders, false) }

    context "when all items are available from the order cycle" do
      before { [variant1, variant2, variant3].each { |v| ex.variants << v } }

      context "and insufficient stock exists to fulfil the order for some items" do
        before do
          variant1.update_attribute(:count_on_hand, 5)
          variant2.update_attribute(:count_on_hand, 2)
          variant3.update_attribute(:count_on_hand, 0)
        end

        it "caps quantity at the stock level for stock-limited items, and reports the change" 

      end
    end

    context "and some items are not available from the order cycle" do
      before { [variant2, variant3].each { |v| ex.variants << v } }

      context "and insufficient stock exists to fulfil the order for some items" do
        before do
          variant1.update_attribute(:count_on_hand, 5)
          variant2.update_attribute(:count_on_hand, 2)
          variant3.update_attribute(:count_on_hand, 0)
        end

        it "sets quantity to 0 for unavailable items, and reports the change" 

      end
    end
  end

  describe "processing a subscription order" do
    let(:subscription) { create(:subscription, with_items: true) }
    let(:proxy_order) { create(:proxy_order, subscription: subscription) }
    let!(:order) { proxy_order.initialise_order! }

    before do
      expect_any_instance_of(Spree::Payment).to_not receive(:process!)
      allow(job).to receive(:send_placement_email)
      allow(job).to receive(:send_empty_email)
    end

    context "when the order is already complete" do
      before { while !order.completed? do break unless order.next! end }

      it "records an issue and ignores it" 

    end

    context "when the order is not already complete" do
      context "when no stock items are available after capping stock" do
        before do
          allow(job).to receive(:unavailable_stock_lines_for) { order.line_items }
        end

        it "does not place the order, sends an empty_order email" 

      end

      context "when at least one stock item is available after capping stock" do
        it "processes the order to completion, but does not process the payment" 


        it "does not enqueue confirmation emails" 


        context "when progression of the order fails" do
          before { allow(order).to receive(:next) { false } }

          it "records an error and does not attempt to send an email" 

        end
      end
    end
  end

  describe "#send_placement_email" do
    let!(:order) { double(:order) }
    let(:mail_mock) { double(:mailer_mock, deliver: true) }

    before do
      allow(SubscriptionMailer).to receive(:placement_email) { mail_mock }
    end

    context "when changes are present" do
      let(:changes) { double(:changes) }

      it "logs an issue and sends the email" 

    end

    context "when no changes are present" do
      let(:changes) { {} }

      it "logs a success and sends the email" 

    end
  end

  describe "#send_empty_email" do
    let!(:order) { double(:order) }
    let(:changes) { double(:changes) }
    let(:mail_mock) { double(:mailer_mock, deliver: true) }

    before do
      allow(SubscriptionMailer).to receive(:empty_email) { mail_mock }
    end

    it "logs an issue and sends the email" 

  end
end

