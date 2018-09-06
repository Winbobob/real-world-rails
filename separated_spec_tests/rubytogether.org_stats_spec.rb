require 'vcr_helper'
require "ostruct"

RSpec.describe Stats, :vcr do

  let!(:member_one) do
    stripe = Stripe::Customer.retrieve("cus_8ff9tXc0ra8927")
    Membership.create name: "Jane Doe", expires_at: 3.days.from_now,
      kind: MembershipPlan.ids.index(:corporate_ruby),
      user: User.create(stripe_id: stripe.id, email: "jane@example.org")
  end
  let!(:member_two) do
    stripe = Stripe::Customer.retrieve("cus_8ff9KmLm6ZG9oW")
    Membership.create name: "Alice Re", expires_at: 3.weeks.from_now,
      kind: MembershipPlan.ids.index(:individual),
      user: User.create(stripe_id: stripe.id, email: "alice@example.org")
  end
  let!(:member_three) do
    stripe = Stripe::Customer.retrieve("cus_8ff95K9mtLvC4w")
    Membership.create name: "Bob Mi", expires_at: 26.days.from_now,
      kind: MembershipPlan.ids.index(:corporate_onyx),
      user: User.create(stripe_id: stripe.id, email: "bob@example.org")
  end
  let!(:expired_member) do
    stripe = Stripe::Customer.retrieve("cus_8ffUbWEM9gofdR")
    Membership.create name: "Expired Fa", expires_at: 4.days.ago,
      kind: MembershipPlan.ids.index(:corporate_topaz),
      user: User.create(stripe_id: stripe.id, email: "expired@example.org")
  end

  subject { Stats } # otherwise it is an instance

  context "since" do
    it "is accurate" 

  end

  context "expiring_annual_memberships" do
    before do
      allow(User).to receive(:trial_stripe_subscriptions).and_return(
        User.all.map { |user| OpenStruct.new(customer: user.stripe_id) }
      )
      member_two.update_attribute :expires_at, 6.weeks.from_now
    end

    it "returns the members expiring in the next month" 

  end

  context "expired_memberships" do
    it "shows expired memberships" 

  end

  context "monthly_revenue_projection" do
    it "is accurate" 

  end

end

