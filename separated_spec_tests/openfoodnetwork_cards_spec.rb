require 'spec_helper'

feature "Credit Cards", js: true do
  include AuthenticationWorkflow
  describe "as a logged in user" do
    let(:user) { create(:user) }
    let!(:card) { create(:credit_card, user_id: user.id, gateway_customer_profile_id: 'cus_AZNMJ') }

    before do
      quick_login_as user

      allow(Stripe).to receive(:api_key) { "sk_test_xxxx" }
      allow(Stripe).to receive(:publishable_key) { "some_token" }
      Spree::Config.set(stripe_connect_enabled: true)

      stub_request(:get, "https://api.stripe.com/v1/customers/cus_AZNMJ").
        to_return(:status => 200, :body => JSON.generate(id: "cus_AZNMJ"))

      stub_request(:delete, "https://api.stripe.com/v1/customers/cus_AZNMJ").
        to_return(:status => 200, :body => JSON.generate(deleted: true, id: "cus_AZNMJ"))
    end

    it "lists saved cards, shows interface for adding new cards" 

  end
end

