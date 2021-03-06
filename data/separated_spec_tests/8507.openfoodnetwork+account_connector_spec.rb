require 'spec_helper'
require 'stripe/account_connector'
require 'stripe/oauth'

module Stripe
  describe AccountConnector do
    describe "create_account" do
      let(:user) { create(:user) }
      let(:enterprise) { create(:enterprise) }
      let(:payload) { { "junk" => "Ssfs" } }
      let(:state) { JWT.encode(payload, Openfoodnetwork::Application.config.secret_token) }
      let(:params) { { "state" => state } }
      let(:connector) { AccountConnector.new(user, params) }

      before do
        allow(Stripe).to receive(:api_key) { "sk_test_12345" }
      end

      context "when the connection was cancelled by the user" do
        before do
          params[:action] = "connect_callback"
          params[:error] = "access_denied"
        end

        it "returns false and does not create a new StripeAccount" 

      end

      context "when the connection was not cancelled by the user" do
        context "when params have no 'code' key" do
          it "raises a StripeError" 

        end

        context "when params have a 'code' key" do
          before { params["code"] = 'code' }

          context "and the decoded state param doesn't contain an 'enterprise_id' key" do
            it "raises an AccessDenied error" 

          end

          context "and the decoded state param contains an 'enterprise_id' key" do
            let(:payload) { { enterprise_id: enterprise.permalink } }
            let(:token_response) { { "stripe_user_id" => "some_user_id", "stripe_publishable_key" => "some_key" } }

            before do
              stub_request(:post, "https://connect.stripe.com/oauth/token").
                with(body: {"code"=>"code", "grant_type"=>"authorization_code"}).
                to_return(status: 200, body: JSON.generate(token_response) )
            end

            context "but the user doesn't manage own or manage the corresponding enterprise" do
              it "makes a request to cancel the Stripe connection and raises an error" 

            end

            context "and the user manages the corresponding enterprise" do
              before do
                user.enterprise_roles.create(enterprise: enterprise)
              end

              it "raises no errors" 


              it "allows creations of a new Stripe Account from the callback params" 

            end

            context "and the user owns the corresponding enterprise" do
              let(:user) { enterprise.owner }

              it "raises no errors" 


              it "allows creations of a new Stripe Account from the callback params" 

            end
          end
        end
      end
    end
  end
end

