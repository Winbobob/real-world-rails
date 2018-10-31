require 'vcr_helper'

RSpec.describe "Stripe webhooks", :vcr do

  describe "customer.source.created" do
    it "runs our hook" 


    context "when user's membership doesn't exist" do
      it "reports the missing membership to Rollbar" 

    end
  end

  describe "invoice.payment_succeeded" do
    let!(:user) { User.create!(stripe_id: "cus_8U1TcYRfvl8VqP", email: "alice@example.com") }
    let!(:membership) { Membership.create(user: user, card_last4: "4242") }
    let(:new_period_end) { Time.now + 3.5.days }

    before do
      allow_any_instance_of(StripeEvent::Invoice::PaymentSucceeded).
        to receive(:new_period_end).and_return(new_period_end)
    end

    it "runs our hook" 

  end

  describe "invoice.payment_failed" do
    let(:user) { User.create!(stripe_id: "cus_8U1TcYRfvl8VqP", email: "alice@example.com") }
    let!(:membership) { Membership.create(user: user, card_last4: "0341", name: "Alice") }

    it "runs our hook" 

  end

  let(:slack_options) { {:username=>"Subscribers", :channel=>"#stripe", :icon_emoji=>":chart_with_upwards_trend:"} }

  describe "customer.subscription.created" do
    let(:message) {
      "1 Onyx Member, 0 Emerald Members, 0 Jade Members, 2 Ruby Members, 0 Sapphire Members, 1 Topaz Member, 0 Friends of Ruby Together, and 1 Developer Member. Projected revenue now $10,810.00 per month."
    }
    let(:membership) { double(Membership) }
    let(:user) { double(User, membership: membership) }

    it "runs our hook" 

  end

  describe "customer.subscription.destroyed" do
    let(:message) {
      "1 Onyx Member, 0 Emerald Members, 0 Jade Members, 2 Ruby Members, 0 Sapphire Members, 1 Topaz Member, 0 Friends of Ruby Together, and 1 Developer Member. Projected revenue now $10,810.00 per month."
    }

    it "runs our hook" 

  end

end

