require "create_membership"

RSpec.describe CreateMembership do

  describe "#customer_for" do
    it "finds customer if user has stripe_id" 


    it "creates customer if user lacks stripe_id" 

  end

  describe "#set_card" do
    let(:cards) { double("Cards") }

    context "without existing card" do
      let(:customer) { double("Customer", sources: cards, default_source: nil) }

      it "adds the card" 

    end

    context "with existing card" do
      let(:customer) { double("Customer", sources: cards, default_source: "card_1") }

      it "adds the card and deletes the old one" 

    end
  end

  describe "#subscribe_to_plan" do
    let(:subs) { double("Subscriptions") }
    let(:user) { double("User", stripe_id: "cust_1", subscriptions: subs) }
    let(:plan) { double("Plan", amount: 100, id: "plan") }

    it "charges the user for the plan" 

  end

  describe "#invite_to_slack" do
    let(:user) { double("User", email: "a@b.c") }

    it "POSTs to Slack asking for an invite" 


    it "doesn't invite friends" 

  end

end

