require 'spec_helper'

describe Stripe::CallbacksController, type: :controller do
  let(:enterprise) { create(:distributor_enterprise) }

  context "#index" do
    let(:params) { { id: enterprise.permalink } }
    let(:connector) { double(:connector) }

    before do
      allow(controller).to receive(:spree_current_user) { enterprise.owner }
      allow(Stripe::AccountConnector).to receive(:new) { connector }
    end

    context "when the connector.create_account raises a StripeError" do
      before do
        allow(connector).to receive(:create_account).and_raise Stripe::StripeError, "some error"
      end

      it "returns a 500 error" 

    end

    context "when the connector.create_account raises an AccessDenied error" do
      before do
        allow(connector).to receive(:create_account).and_raise CanCan::AccessDenied, "some error"
      end

      it "redirects to unauthorized" 

    end

    context "when the connector fails in creating a new stripe account record" do
      before { allow(connector).to receive(:create_account) { false } }

      context "when the user cancelled the connection" do
        before { allow(connector).to receive(:connection_cancelled_by_user?) { true } }

        it "renders a failure message" 

      end

      context "when some other error caused the failure" do
        before { allow(connector).to receive(:connection_cancelled_by_user?) { false } }

        it "renders a failure message" 

      end
    end

    context "when the connector succeeds in creating a new stripe account record" do
      before { allow(connector).to receive(:create_account) { true } }

      it "redirects to the enterprise edit path" 

    end
  end
end

