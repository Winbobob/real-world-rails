# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::StoreCreditEventsHelper, type: :helper do
  describe "#store_credit_event_admin_action_name" do
    let(:store_credit_event) { create(:store_credit_event, action: action) }

    subject { store_credit_event_admin_action_name(store_credit_event) }

    context "capture event" do
      let(:action) { Spree::StoreCredit::CAPTURE_ACTION }

      it "returns the action's display text" 

    end

    context "authorize event" do
      let(:action) { Spree::StoreCredit::AUTHORIZE_ACTION }

      it "returns the action's display text" 

    end

    context "eligible event" do
      let(:action) { Spree::StoreCredit::ELIGIBLE_ACTION }

      it "returns the action's display text" 

    end

    context "allocation event" do
      let(:action) { Spree::StoreCredit::ALLOCATION_ACTION }

      it "returns the action's display text" 

    end

    context "void event" do
      let(:action) { Spree::StoreCredit::VOID_ACTION }

      it "returns the action's display text" 

    end

    context "credit event" do
      let(:action) { Spree::StoreCredit::CREDIT_ACTION }

      it "returns the action's display text" 

    end
  end

  describe "#store_credit_event_originator_link" do
    let(:store_credit_event) { create(:store_credit_adjustment_event, originator: originator) }

    subject { store_credit_event_originator_link(store_credit_event) }

    context "originator is a user" do
      let(:originator) { create(:user) }

      it "returns a link to the user's edit page" 

    end

    context "originator is a payment" do
      let(:originator) { create(:payment) }

      it "returns a link to the order's payments page" 

    end

    context "originator is a refund" do
      let(:originator) { create(:refund, amount: 1.0) }

      it "returns a link to the order's payments page" 

    end

    context "originator is not specifically handled" do
      let(:originator) { create(:store_credit_update_reason) }

      it "raises an error" 

    end
  end
end

