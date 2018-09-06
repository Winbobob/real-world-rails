require 'spec_helper'

describe Admin::StripeAccountsController, type: :controller do
  let(:enterprise) { create(:distributor_enterprise) }

  before do
    allow(Stripe).to receive(:client_id) { "some_id" }
  end

  describe "#connect" do
    before do
      allow(controller).to receive(:spree_current_user) { enterprise.owner }
    end

    it "redirects to Stripe Authorization url constructed OAuth" 

  end

  describe "#destroy" do
    let(:params) { { format: :json, id: "some_id" } }

    context "when the specified stripe account doesn't exist" do
      it "raises an error?" 

    end

    context "when the specified stripe account exists" do
      let(:stripe_account) { create(:stripe_account, enterprise: enterprise) }

      before do
        # So that we can stub #deauthorize_and_destroy
        allow(StripeAccount).to receive(:find) { stripe_account }
        params[:id] = stripe_account.id
      end

      context "when I don't manage the enterprise linked to the stripe account" do
        let(:some_user) { create(:user) }

        before { allow(controller).to receive(:spree_current_user) { some_user } }

        it "redirects to unauthorized" 

      end

      context "when I manage the enterprise linked to the stripe account" do
        before { allow(controller).to receive(:spree_current_user) { enterprise.owner } }

        context "and the attempt to deauthorize_and_destroy succeeds" do
          before { allow(stripe_account).to receive(:deauthorize_and_destroy) { stripe_account } }

          it "redirects to unauthorized" 

        end

        context "and the attempt to deauthorize_and_destroy fails" do
          before { allow(stripe_account).to receive(:deauthorize_and_destroy) { false } }

          it "redirects to unauthorized" 

        end
      end
    end
  end

  describe "#status" do
    let(:params) { { format: :json, enterprise_id: enterprise.id } }

    before do
      allow(Stripe).to receive(:api_key) { "sk_test_12345" }
      Spree::Config.set(stripe_connect_enabled: false)
    end

    context "when I don't manage the specified enterprise" do
      let(:user) { create(:user) }

      before do
        allow(controller).to receive(:spree_current_user) { user }
      end

      it "redirects to unauthorized" 

    end

    context "when I manage the specified enterprise" do
      before do
        allow(controller).to receive(:spree_current_user) { enterprise.owner }
      end

      context "when Stripe is not enabled" do
        it "returns with a status of 'stripe_disabled'" 

      end

      context "when Stripe is enabled" do
        before { Spree::Config.set(stripe_connect_enabled: true) }

        context "when no stripe account is associated with the specified enterprise" do
          it "returns with a status of 'account_missing'" 

        end

        context "when a stripe account is associated with the specified enterprise" do
          let!(:account) { create(:stripe_account, stripe_user_id: "acc_123", enterprise: enterprise) }

          context "but access has been revoked or does not exist on stripe's servers" do
            before do
              stub_request(:get, "https://api.stripe.com/v1/accounts/acc_123").to_return(status: 404)
            end

            it "returns with a status of 'access_revoked'" 

          end

          context "which is connected" do
            let(:stripe_account_mock) do
              {
                id: "acc_123",
                business_name: "My Org",
                charges_enabled: true,
                some_other_attr: "something"
              }
            end

            before do
              stub_request(:get, "https://api.stripe.com/v1/accounts/acc_123").to_return(body: JSON.generate(stripe_account_mock))
            end

            it "returns with a status of 'connected'" 

          end
        end
      end
    end
  end
end

