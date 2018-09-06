require 'spec_helper'
require 'support/request/authentication_workflow'

describe Spree::CreditCardsController, type: :controller do
  include AuthenticationWorkflow
  let(:user) { create_enterprise_user }
  let(:token) { "tok_234bd2c22" }

  before do
    allow(Stripe).to receive(:api_key) { "sk_test_12345" }
    allow(controller).to receive(:spree_current_user) { user }
  end

  describe "#new_from_token" do
    let(:params) do
      {
        format: :json,
        "exp_month" => 12,
        "exp_year" => 2020,
        "last4" => 4242,
        "token" => token,
        "cc_type" => "visa"
      }
    end

    before do
      stub_request(:post, "https://api.stripe.com/v1/customers")
        .with(:body => { email: user.email, source: token })
        .to_return(response_mock)
    end

    context "when the request to store the customer/card with Stripe is successful" do
      let(:response_mock) { { status: 200, body: JSON.generate(id: "cus_AZNMJ", default_source: "card_1AEEb") } }

      it "saves the card locally" 


      context "when saving the card locally fails" do
        before do
          allow(controller).to receive(:stored_card_attributes) { {} }
        end

        it "renders a flash error" 

      end
    end

    context "when the request to store the customer/card with Stripe fails" do
      let(:response_mock) { { status: 402, body: JSON.generate(error: { message: "Bup-bow..." }) } }
      it "doesn't save the card locally, and renders a flash error" 

    end
  end

  describe "#destroy" do
    context "when the specified credit card is not found" do
      let(:params) { { id: 123 } }

      it "redirects to /account with a flash error, does not request deletion with Stripe" 

    end

    context "when the specified credit card is found" do
      let!(:card) { create(:credit_card, gateway_customer_profile_id: 'cus_AZNMJ') }
      let(:params) { { id: card.id } }

      context "but the card is not owned by the user" do
        it "redirects to unauthorized" 

      end

      context "and the card is owned by the user" do
        before do
          card.update_attribute(:user_id, user.id)

          stub_request(:get, "https://api.stripe.com/v1/customers/cus_AZNMJ").
            to_return(:status => 200, :body => JSON.generate(id: "cus_AZNMJ"))
        end

        context "where the request to destroy the Stripe customer fails" do
          before do
            stub_request(:delete, "https://api.stripe.com/v1/customers/cus_AZNMJ").
              to_return(:status => 402, :body => JSON.generate(error: { message: 'Bup-bow!' }))
          end

          it "doesn't delete the card" 

        end

        context "where the request to destroy the Stripe customer succeeds" do
          before do
            stub_request(:delete, "https://api.stripe.com/v1/customers/cus_AZNMJ").
              to_return(:status => 200, :body => JSON.generate(deleted: true, id: "cus_AZNMJ"))
          end

          it "deletes the card and redirects to account_path" 

        end
      end
    end
  end
end

