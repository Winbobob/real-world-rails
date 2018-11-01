require 'spec_helper'

describe SubscriptionMailer do
  include ActionView::Helpers::SanitizeHelper

  let!(:mail_method) { create(:mail_method, preferred_mails_from: 'spree@example.com') }

  describe "order placement" do
    let(:shop) { create(:enterprise) }
    let(:customer) { create(:customer, enterprise: shop) }
    let(:subscription) { create(:subscription, shop: shop, customer: customer, with_items: true) }
    let(:proxy_order) { create(:proxy_order, subscription: subscription) }
    let!(:order) { proxy_order.initialise_order! }

    context "when changes have been made to the order" do
      let(:changes) { {} }

      before do
        changes[order.line_items.first.id] = 2
        expect do
          SubscriptionMailer.placement_email(order, changes).deliver
        end.to change{ SubscriptionMailer.deliveries.count }.by(1)
      end

      it "sends the email, which notifies the customer of changes made" 

    end

    context "and changes have not been made to the order" do
      before do
        expect do
          SubscriptionMailer.placement_email(order, {}).deliver
        end.to change{ SubscriptionMailer.deliveries.count }.by(1)
      end

      it "sends the email" 

    end

    describe "linking to order page" do
      let(:order_link_href) { "href=\"#{spree.order_url(order)}\"" }
      let(:order_link_style) { "style='[^']+'" }

      let(:shop) { create(:enterprise, allow_order_changes: true) }

      let(:email) { SubscriptionMailer.deliveries.last }
      let(:body) { email.body.encoded }

      before do
        SubscriptionMailer.placement_email(order, {}).deliver
      end

      context "when the customer has a user account" do
        let(:customer) { create(:customer, enterprise: shop) }

        it "provides link to make changes" 


        context "when the distributor does not allow changes to the order" do
          let(:shop) { create(:enterprise, allow_order_changes: false) }

          it "provides link to view details" 

        end
      end

      context "when the customer has no user account" do
        let(:customer) { create(:customer, enterprise: shop, user: nil) }

        it "does not provide link" 


        context "when the distributor does not allow changes to the order" do
          let(:shop) { create(:enterprise, allow_order_changes: false) }

          it "does not provide link" 

        end
      end
    end
  end

  describe "order confirmation" do
    let(:customer) { create(:customer) }
    let(:subscription) { create(:subscription, customer: customer, with_items: true) }
    let(:proxy_order) { create(:proxy_order, subscription: subscription) }
    let!(:order) { proxy_order.initialise_order! }

    before do
      expect do
        SubscriptionMailer.confirmation_email(order).deliver
      end.to change{ SubscriptionMailer.deliveries.count }.by(1)
    end

    it "sends the email" 


    describe "linking to order page" do
      let(:order_link_href) { "href=\"#{spree.order_url(order)}\"" }

      let(:email) { SubscriptionMailer.deliveries.last }
      let(:body) { email.body.encoded }

      context "when the customer has a user account" do
        let(:customer) { create(:customer) }

        it "provides link to view details" 

      end

      context "when the customer has no user account" do
        let(:customer) { create(:customer, user: nil) }

        it "does not provide link" 

      end
    end
  end

  describe "empty order notification" do
    let(:subscription) { create(:subscription, with_items: true) }
    let(:proxy_order) { create(:proxy_order, subscription: subscription) }
    let!(:order) { proxy_order.initialise_order! }

    before do
      expect do
        SubscriptionMailer.empty_email(order, {}).deliver
      end.to change{ SubscriptionMailer.deliveries.count }.by(1)
    end

    it "sends the email" 

  end

  describe "failed payment notification" do
    let(:customer) { create(:customer) }
    let(:subscription) { create(:subscription, customer: customer, with_items: true) }
    let(:proxy_order) { create(:proxy_order, subscription: subscription) }
    let!(:order) { proxy_order.initialise_order! }

    before do
      order.errors.add(:base, "This is a payment failure error")

      expect do
        SubscriptionMailer.failed_payment_email(order).deliver
      end.to change{ SubscriptionMailer.deliveries.count }.by(1)
    end

    it "sends the email" 


    describe "linking to order page" do
      let(:order_link_href) { "href=\"#{spree.order_url(order)}\"" }

      let(:email) { SubscriptionMailer.deliveries.last }
      let(:body) { email.body.encoded }

      context "when the customer has a user account" do
        let(:customer) { create(:customer) }

        it "provides link to view details" 

      end

      context "when the customer has no user account" do
        let(:customer) { create(:customer, user: nil) }

        it "does not provide link" 

      end
    end
  end

  describe "order placement summary" do
    let!(:shop) { create(:enterprise) }
    let!(:summary) { double(:summary, shop_id: shop.id) }
    let(:body) { strip_tags(SubscriptionMailer.deliveries.last.body.encoded) }
    let(:scope) { "subscription_mailer" }

    before { allow(summary).to receive(:unrecorded_ids) { [] } }

    context "when no issues were encountered while processing subscriptions" do
      before do
        allow(summary).to receive(:order_count) { 37 }
        allow(summary).to receive(:issue_count) { 0 }
        allow(summary).to receive(:issues) { {} }
        SubscriptionMailer.placement_summary_email(summary).deliver
      end

      it "sends the email, which notifies the enterprise that all orders were successfully processed" 

    end

    context "when some issues were encountered while processing subscriptions" do
      let(:order1) { double(:order, id: 1, number: "R123456", to_s: "R123456") }
      let(:order2) { double(:order, id: 2, number: "R654321", to_s: "R654321") }

      before do
        allow(summary).to receive(:order_count) { 37 }
        allow(summary).to receive(:success_count) { 35 }
        allow(summary).to receive(:issue_count) { 2 }
        allow(summary).to receive(:issues) { { processing: { 1 => "Some Error Message", 2 => nil } } }
        allow(summary).to receive(:orders_affected_by) { [order1, order2] }
      end

      context "when no unrecorded issues are present" do
        it "sends the email, which notifies the enterprise that some issues were encountered" 

      end

      context "when some undocumented orders are present" do
        let(:order3) { double(:order, id: 3, number: "R333333", to_s: "R333333") }
        let(:order4) { double(:order, id: 4, number: "R444444", to_s: "R444444") }

        before do
          allow(summary).to receive(:unrecorded_ids) { [3, 4] }
        end

        it "sends the email, which notifies the enterprise that some issues were encountered" 

      end
    end

    context "when no subscriptions were processed successfully" do
      let(:order1) { double(:order, id: 1, number: "R123456", to_s: "R123456") }
      let(:order2) { double(:order, id: 2, number: "R654321", to_s: "R654321") }

      before do
        allow(summary).to receive(:order_count) { 2 }
        allow(summary).to receive(:success_count) { 0 }
        allow(summary).to receive(:issue_count) { 2 }
        allow(summary).to receive(:issues) { { changes: { 1 => nil, 2 => nil } } }
        allow(summary).to receive(:orders_affected_by) { [order1, order2] }
        SubscriptionMailer.placement_summary_email(summary).deliver
      end

      it "sends the email, which notifies the enterprise that some issues were encountered" 

    end
  end

  describe "order confirmation summary" do
    let!(:shop) { create(:enterprise) }
    let!(:summary) { double(:summary, shop_id: shop.id) }
    let(:body) { strip_tags(SubscriptionMailer.deliveries.last.body.encoded) }
    let(:scope) { "subscription_mailer" }

    before { allow(summary).to receive(:unrecorded_ids) { [] } }

    context "when no issues were encountered while processing subscriptions" do
      before do
        allow(summary).to receive(:order_count) { 37 }
        allow(summary).to receive(:issue_count) { 0 }
        allow(summary).to receive(:issues) { {} }
        SubscriptionMailer.confirmation_summary_email(summary).deliver
      end

      it "sends the email, which notifies the enterprise that all orders were successfully processed" 

    end

    context "when some issues were encountered while processing subscriptions" do
      let(:order1) { double(:order, id: 1, number: "R123456", to_s: "R123456") }
      let(:order2) { double(:order, id: 2, number: "R654321", to_s: "R654321") }

      before do
        allow(summary).to receive(:order_count) { 37 }
        allow(summary).to receive(:success_count) { 35 }
        allow(summary).to receive(:issue_count) { 2 }
        allow(summary).to receive(:issues) { { failed_payment: { 1 => "Some Error Message", 2 => nil } } }
        allow(summary).to receive(:orders_affected_by) { [order1, order2] }
      end

      context "when no unrecorded issues are present" do
        it "sends the email, which notifies the enterprise that some issues were encountered" 

      end

      context "when some undocumented orders are present" do
        let(:order3) { double(:order, id: 3, number: "R333333", to_s: "R333333") }
        let(:order4) { double(:order, id: 4, number: "R444444", to_s: "R444444") }

        before do
          allow(summary).to receive(:unrecorded_ids) { [3, 4] }
        end

        it "sends the email, which notifies the enterprise that some issues were encountered" 

      end
    end

    context "when no subscriptions were processed successfully" do
      let(:order1) { double(:order, id: 1, number: "R123456", to_s: "R123456") }
      let(:order2) { double(:order, id: 2, number: "R654321", to_s: "R654321") }

      before do
        allow(summary).to receive(:order_count) { 2 }
        allow(summary).to receive(:success_count) { 0 }
        allow(summary).to receive(:issue_count) { 2 }
        allow(summary).to receive(:issues) { { changes: { 1 => nil, 2 => nil } } }
        allow(summary).to receive(:orders_affected_by) { [order1, order2] }
        SubscriptionMailer.confirmation_summary_email(summary).deliver
      end

      it "sends the email, which notifies the enterprise that some issues were encountered" 

    end
  end
end

